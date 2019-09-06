data "template_file" "keepalived_service" {
  template = "${file("${path.module}/files/keepalived.service.tpl")}"

  vars {
    keepalived_version = "${var.keepalived_version}"
  }
}

data "ignition_systemd_unit" "keepalived_service" {
  name    = "keepalived.service"
  enabled = true
  content = "${data.template_file.keepalived_service.rendered}"
}

output "keepalived_service" {
  value = "${data.ignition_systemd_unit.keepalived_service.id}"
}
