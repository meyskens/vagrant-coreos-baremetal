# This template is used to generate the backends part of the config
data "template_file" "haproxy_backends" {
  count    = "${length(var.controller_domains)}"
  template = "${file("${path.module}/files/haproxy-backend.tpl")}"

  vars {
    port    = "${var.k8s_apiserver_port}"
    address = "${element(var.controller_domains, count.index)}"

    # Gets master1 from master1.domain.com
    name = "${element(split(".", element(var.controller_domains, count.index)), 0)}"
  }
}

data "template_file" "haproxy_conf" {
  template = "${file("${path.module}/files/haproxy.conf.tpl")}"

  vars {
    haproxy_stats_user     = "${var.haproxy_stats_user}"
    haproxy_stats_password = "${var.haproxy_stats_password}"
    haproxy_apiserver_port = "${var.haproxy_apiserver_port}"
    haproxy_stats_port     = "${var.haproxy_stats_port}"
    backends               = "${join("", data.template_file.haproxy_backends.*.rendered)}"
  }
}

data "ignition_file" "haproxy_conf" {
  filesystem = "root"
  path       = "/etc/haproxy/haproxy.conf"
  mode       = "0644"

  content {
    content = "${data.template_file.haproxy_conf.rendered}"
  }
}

output "haproxy_conf" {
  value = "${data.ignition_file.haproxy_conf.id}"
}
