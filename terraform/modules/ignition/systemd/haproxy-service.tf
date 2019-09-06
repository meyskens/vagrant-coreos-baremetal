data "template_file" "haproxy_service" {
  template = "${file("${path.module}/files/haproxy.service.tpl")}"

  vars {
    haproxy_syslogd_version = "${var.haproxy_syslogd_version}"
    haproxy_apiserver_port  = "${var.haproxy_apiserver_port}"
    haproxy_stats_port      = "${var.haproxy_stats_port}"
  }
}

data "ignition_systemd_unit" "haproxy_service" {
  name    = "haproxy.service"
  enabled = true
  content = "${data.template_file.haproxy_service.rendered}"
}

output "haproxy_service" {
  value = "${data.ignition_systemd_unit.haproxy_service.id}"
}
