#!/usr/bin/env python

# works under python2 and python3

import sys
import json

# master-1=https://master-1.k8s.pipeline.prod.srcd.host:2380,master-2=https://master-2.k8s.pipeline.prod.srcd.host:2380,master-3=https://master-3.k8s.pipeline.prod.srcd.host:2380

json_input = json.loads(sys.stdin.read())
controllers = json_input["controllers"].split(",")
cluster_string = ",".join(["{}=https://{}:2380".format(c.split(".")[0], c) for c in controllers])
print(json.dumps({ "etcd_initial_cluster_string": cluster_string }))
