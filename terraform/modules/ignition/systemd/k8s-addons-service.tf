data "ignition_systemd_unit" "k8s_addons_service" {
  name    = "k8s-addons.service"
  content = "${file("${path.module}/files/k8s-addons.service")}"
}

output "k8s_addons_service" {
  value = "${data.ignition_systemd_unit.k8s_addons_service.id}"
}
