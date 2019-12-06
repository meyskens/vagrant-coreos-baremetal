data "ignition_systemd_unit" "bootkube_service" {
  name    = "bootkube.service"
  content = "${file("${path.module}/files/bootkube.service")}"
}

output "bootkube_service" {
  value = "${data.ignition_systemd_unit.bootkube_service.id}"
}
