data "ignition_systemd_unit" "iptables_restore_service" {
  name    = "iptables-restore.service"
  enabled = true
}

output "iptables_restore_service" {
  value = "${data.ignition_systemd_unit.iptables_restore_service.id}"
}
