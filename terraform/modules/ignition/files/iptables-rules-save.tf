data "ignition_file" "iptables_rules_save" {
  filesystem = "root"
  path       = "/var/lib/iptables/rules-save"
  mode       = "0500"

  content {
    content = "${file("${path.module}/files/iptables-rules-save")}"
  }
}

output "iptables_rules_save" {
  value = "${data.ignition_file.iptables_rules_save.id}"
}
