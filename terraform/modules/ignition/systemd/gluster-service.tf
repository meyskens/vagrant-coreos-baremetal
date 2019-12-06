data "template_file" "gluster_service" {
  template = "${file("${path.module}/files/gluster.service.tpl")}"

  vars {
    gluster_version = "${var.gluster_version}"
  }
}

data "ignition_systemd_unit" "gluster_service" {
  name    = "gluster.service"
  enabled = true
  content = "${data.template_file.gluster_service.rendered}"
}

output "gluster_service" {
  value = "${data.ignition_systemd_unit.gluster_service.id}"
}
