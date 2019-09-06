data "ignition_file" "hostname" {
  count      = "${length(var.domains)}"
  filesystem = "root"
  path       = "/etc/hostname"
  mode       = "0644"

  content {
    content = "${element(var.domains, count.index)}"
  }
}

output "hostname" {
  value = "${data.ignition_file.hostname.*.id}"
}
