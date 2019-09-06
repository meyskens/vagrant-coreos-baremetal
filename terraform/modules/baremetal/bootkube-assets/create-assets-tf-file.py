#!/usr/bin/env python

import os
import re

cwd = os.getcwd()
assets_dir = cwd + "/files"
bootkube_dir = "/opt/bootkube/assets"

ignition_file = """
data "ignition_file" "{0}" {{
  filesystem = "root"
  path       = "{1}"
  mode       = "0644"
  count      = "${{var.create_assets ? 1 : 0}}"

  content {{
    content = "${{file("${{path.module}}/files/{2}")}}"
  }}
}}
"""

resources = []
output = []
for root, dirs, files in os.walk(assets_dir):
    if not files: continue

    for file in files:
        sub_dir = re.sub('^%s' % assets_dir + "/", '', root)
        local_asset = os.path.join(sub_dir, file)
        remote_path = os.path.join(bootkube_dir, local_asset)

        resource_name = re.sub("-", "_", local_asset)
        resource_name = re.sub("/", "__", resource_name)
        resource_name = re.sub("\.", "___", resource_name)

        resources.append(resource_name)

        output.append(ignition_file.format(resource_name, remote_path, local_asset))

output_resources = ",\n".join('     "${{data.ignition_file.{0}.*.id}}"'.format(r) for r in resources)
output.append(
"""
output "assets" {{
  value = [
{0}
  ]
}}
""".format(output_resources))



output_file = os.path.join(cwd, "main.tf")
with open(output_file, "w") as fh:
    fh.write("# Created using {}\n".format(os.path.basename(__file__)))
    fh.writelines(output)
