data "ignition_systemd_unit" "wait_for_dns_service" {
  name    = "wait-for-dns.service"
  content = "${file("${path.module}/files/wait-for-dns.service")}"
}

output "wait_for_dns_service" {
  value = "${data.ignition_systemd_unit.wait_for_dns_service.id}"
}
