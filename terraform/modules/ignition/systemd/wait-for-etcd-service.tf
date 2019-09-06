data "ignition_systemd_unit" "wait_for_etcd_service" {
  name    = "wait-for-etcd.service"
  content = "${file("${path.module}/files/wait-for-etcd.service")}"
}

output "wait_for_etcd_service" {
  value = "${data.ignition_systemd_unit.wait_for_etcd_service.id}"
}
