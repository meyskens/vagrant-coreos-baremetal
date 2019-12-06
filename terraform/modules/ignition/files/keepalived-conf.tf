data "template_file" "keepalived_conf" {
  template = "${file("${path.module}/files/keepalived.conf.tpl")}"

  vars {
    interface              = "${var.keepalived_interface}"
    virtual_router_id      = "${var.keepalived_virtual_router_id}"
    virtual_ipaddress      = "${var.keepalived_virtual_ipaddress}"
    haproxy_apiserver_port = "${var.haproxy_apiserver_port}"
  }
}

data "ignition_file" "keepalived_conf" {
  filesystem = "root"
  path       = "/etc/keepalived/keepalived.conf"
  mode       = "0644"

  content {
    content = "${data.template_file.keepalived_conf.rendered}"
  }
}

output "keepalived_conf" {
  value = "${data.ignition_file.keepalived_conf.id}"
}
