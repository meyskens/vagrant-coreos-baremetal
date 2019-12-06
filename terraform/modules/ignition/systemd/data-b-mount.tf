data "template_file" "data_b_mount" {
  template = "${file("${path.module}/files/data.mount.tpl")}"

  vars {
    label = "DATAB"
    where = "/data-b"
    type  = "${var.filesystem_type}"
  }
}

data "ignition_systemd_unit" "data_b_mount" {
  name    = "data\\x2db.mount"
  content = "${data.template_file.data_b_mount.rendered}"
}

output "data_b_mount" {
  value = "${data.ignition_systemd_unit.data_b_mount.id}"
}
