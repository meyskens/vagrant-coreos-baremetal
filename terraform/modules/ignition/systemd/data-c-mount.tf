data "template_file" "data_c_mount" {
  template = "${file("${path.module}/files/data.mount.tpl")}"

  vars {
    label = "DATAC"
    where = "/data-c"
    type  = "${var.filesystem_type}"
  }
}

data "ignition_systemd_unit" "data_c_mount" {
  name    = "data\\x2dc.mount"
  content = "${data.template_file.data_c_mount.rendered}"
}

output "data_c_mount" {
  value = "${data.ignition_systemd_unit.data_c_mount.id}"
}
