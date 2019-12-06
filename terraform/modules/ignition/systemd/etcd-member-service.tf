# cannot do a map of a list in terraform, so we build the string externally
data "external" "etcd_initial_cluster_string" {
  program = ["python", "${path.module}/external/gen-etcd-initial-cluster-string.py"]

  query = {
    controllers = "${join(",", var.controller_domains)}"
  }
}

data "template_file" "etcd_cluster_conf" {
  count    = "${length(var.controller_domains)}"
  template = "${file("${path.module}/files/40-etcd-cluster.conf.tpl")}"

  vars {
    etcd_image_tag           = "${var.etcd_image_tag}"
    etcd_name                = "${element(split(".", element(var.controller_domains, count.index)), 0)}"
    etcd_fqdn                = "${element(var.controller_domains, count.index)}"
    etcd_initial_cluster     = "${data.external.etcd_initial_cluster_string.result["etcd_initial_cluster_string"]}"
    etcd_listen_client_urls  = "${var.etcd_listen_client_urls}"
    etcd_listen_peers_urls   = "${var.etcd_listen_peers_urls}"
    etcd_listen_metrics_urls = "${var.etcd_listen_metrics_urls}"
    etcd_data_dir            = "${var.etcd_data_dir}"
  }
}

data "ignition_systemd_unit" "etcd_member_service" {
  count   = "${length(var.controller_domains)}"
  name    = "etcd-member.service"
  enabled = true

  dropin {
    name    = "40-etcd-cluster.conf"
    content = "${element(data.template_file.etcd_cluster_conf.*.rendered, count.index)}"
  }
}

output "etcd_member_service" {
  value = "${data.ignition_systemd_unit.etcd_member_service.*.id}"
}
