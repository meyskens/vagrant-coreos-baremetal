data "template_file" "data_mount" {
  template = "${file("${path.module}/files/data.mount.tpl")}"

  vars {
    label = "DATA"
    where = "/data"
    type  = "${var.filesystem_type}"
  }
}

data "ignition_systemd_unit" "data_mount" {
  name    = "data.mount"
  content = "${data.template_file.data_mount.rendered}"
}

output "data_mount" {
  value = "${data.ignition_systemd_unit.data_mount.id}"
}
