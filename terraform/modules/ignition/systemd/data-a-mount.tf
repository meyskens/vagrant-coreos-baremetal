data "template_file" "data_a_mount" {
  template = "${file("${path.module}/files/data.mount.tpl")}"

  vars {
    label = "DATAA"
    where = "/data-a"
    type  = "${var.filesystem_type}"
  }
}

data "ignition_systemd_unit" "data_a_mount" {
  name    = "data\\x2da.mount"
  content = "${data.template_file.data_a_mount.rendered}"
}

output "data_a_mount" {
  value = "${data.ignition_systemd_unit.data_a_mount.id}"
}
