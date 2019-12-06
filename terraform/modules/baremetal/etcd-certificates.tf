variable "etcd_user_uid" {
  default = "232"
}

variable "etcd_user_gid" {
  default = "232"
}

data "ignition_file" "etcd__etcd_client_ca___crt" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd-client-ca.crt"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_ca_cert}"
  }
}

data "ignition_file" "etcd__etcd_client___crt" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd-client.crt"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_client_cert}"
  }
}

data "ignition_file" "etcd__etcd_client___key" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd-client.key"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_client_key}"
  }
}

data "ignition_file" "etcd__etcd__server_ca___crt" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd/server-ca.crt"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_ca_cert}"
  }
}

data "ignition_file" "etcd__etcd__server___crt" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd/server.crt"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_server_cert}"
  }
}

data "ignition_file" "etcd__etcd__server___key" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd/server.key"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_server_key}"
  }
}

data "ignition_file" "etcd__etcd__peer_ca___crt" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd/peer-ca.crt"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_ca_cert}"
  }
}

data "ignition_file" "etcd__etcd__peer___crt" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd/peer.crt"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_peer_cert}"
  }
}

data "ignition_file" "etcd__etcd__peer___key" {
  filesystem = "root"
  path       = "/etc/ssl/etcd/etcd/peer.key"
  mode       = "0400"
  uid        = "${var.etcd_user_uid}"
  gid        = "${var.etcd_user_gid}"

  content {
    content = "${module.bootkube.etcd_peer_key}"
  }
}
