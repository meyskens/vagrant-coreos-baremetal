data "template_file" "net_10_internal0_link" {
  count    = "${var.server_count}"
  template = "${file("${path.module}/files/10-internal0.link.tpl")}"

  vars {
    mac_address = "${lookup(var.internal_interfaces[count.index], "mac", "")}"
    mtu_bytes   = "${var.internal_mtu_bytes}"
  }
}

data "ignition_networkd_unit" "net_10_internal0_link" {
  count   = "${var.server_count}"
  name    = "10-internal0.link"
  content = "${element(data.template_file.net_10_internal0_link.*.rendered, count.index)}"
}

output "net_10_internal0_link" {
  value = "${data.ignition_networkd_unit.net_10_internal0_link.*.id}"
}

##
data "ignition_networkd_unit" "net_20_internal0_network_with_dhcp" {
  name    = "20-internal0.network"
  content = "${file("${path.module}/files/20-internal0.network-with-dhcp")}"
}

output "net_20_internal0_network_with_dhcp" {
  value = "${data.ignition_networkd_unit.net_20_internal0_network_with_dhcp.id}"
}

##
data "ignition_networkd_unit" "net_20_internal0_k8s_network" {
  name    = "20-internal0.k8s.network"
  content = "${file("${path.module}/files/20-internal0.k8s.network")}"
}

output "net_20_internal0_k8s_network" {
  value = "${data.ignition_networkd_unit.net_20_internal0_k8s_network.*.id}"
}
