provider "matchbox" {
  endpoint    = "${var.matchbox_rpc_endpoint}"
  client_cert = "${file("${path.module}/../../../ansible/roles/provisioner/files/client.crt")}"
  client_key  = "${file("${path.module}/../../../ansible/roles/provisioner/files/client.key")}"
  ca          = "${file("${path.module}/../../../ansible/roles/provisioner/files/ca.crt")}"
}

resource "matchbox_profile" "controllers" {
  count  = "${length(var.controller_domains)}"
  name   = "${format("%s-controller-%s", var.cluster_name, element(split(".", element(var.controller_domains, count.index)), 0))}"
  kernel = "/assets/coreos/${var.container_linux_version}/coreos_production_pxe.vmlinuz"

  initrd = [
    "/assets/coreos/${var.container_linux_version}/coreos_production_pxe_image.cpio.gz",
  ]

  args = [
    "coreos.config.url=http://${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}",
    "coreos.first_boot=yes",
    "console=tty0",
    "initrd=coreos_production_pxe_image.cpio.gz",
  ]

  raw_ignition = "${element(data.ignition_config.controller.*.rendered, count.index)}"
}

resource "matchbox_group" "controller" {
  count   = "${length(var.controller_domains)}"
  name    = "${format("%s-%s", var.cluster_name, element(split(".", element(var.controller_domains, count.index)), 0))}"
  profile = "${element(matchbox_profile.controllers.*.name, count.index)}"

  selector {
    mac = "${lookup(var.controller_internal_interfaces[count.index], "mac", "")}"
  }
}
