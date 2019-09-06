data "ignition_config" "controller" {
  count = "${length(var.controller_domains)}"

  // Uncomment these to run disk experiments

  // disks = [
  //   "${var.wipe_controller_filesystems ? data.ignition_disk.sda.id : ""}",
  //   "${var.wipe_controller_filesystems ? data.ignition_disk.sdb.id : ""}",
  //   "${var.wipe_controller_filesystems ? data.ignition_disk.sdc.id : ""}",
  // ]

  // arrays = [
  //   "${data.ignition_raid.md0.id}",
  // ]

  // filesystems = [
  //   "${data.ignition_filesystem.data.id}",
  //   "${data.ignition_filesystem.data_a.id}",
  //   "${data.ignition_filesystem.data_b.id}",
  //   "${data.ignition_filesystem.data_c.id}",
  // ]

  networkd = [
    "${element(module.controller_ignition_networkd.net_10_internal0_link, count.index)}",
    "${module.controller_ignition_networkd.net_20_internal0_network_with_dhcp}",
  ]

  systemd = [
    // "${module.controller_ignition_systemd.data_mount}",
    // "${module.controller_ignition_systemd.data_a_mount}",
    // "${module.controller_ignition_systemd.data_b_mount}",
    // "${module.controller_ignition_systemd.data_c_mount}",
    // "${module.controller_ignition_systemd.etcd_data_dir_service}", // uncomment to store etcd data on disk
    "${element(module.controller_ignition_systemd.etcd_member_service, count.index)}",
    "${module.controller_ignition_systemd.locksmithd_service}",
    "${module.controller_ignition_systemd.docker_service}",
    "${module.controller_ignition_systemd.wait_for_etcd_service}",
    "${element(module.controller_ignition_systemd.kubelet_controller_service, count.index)}",
    "${module.controller_ignition_systemd.bootkube_service}",
    "${module.controller_ignition_systemd.haproxy_service}",
    "${module.controller_ignition_systemd.keepalived_service}",
    "${module.controller_ignition_systemd.iptables_restore_service}",
    "${module.controller_ignition_systemd.k8s_addons_service}",
  ]
  # In files we have a combination of:
  # - Files from ignition modules
  # - bootkube certificates (from terraform-render-bootkube outputs)
  # - bootkube generated assets (from terraform-render-bootkube assets)
  # - k8s addons
  files = [
    "${module.controller_ignition_files.kubelet_env}",
    "${element(module.controller_ignition_files.hostname, count.index)}",
    "${module.controller_ignition_files.max_user_watches_conf}",
    "${module.controller_ignition_files.bootkube_start}",
    "${module.controller_ignition_files.keepalived_conf}",
    "${module.controller_ignition_files.haproxy_conf}",
    "${module.controller_ignition_files.check_tcp_port}",
    "${module.controller_ignition_files.iptables_rules_save}",
    "${module.controller_ignition_files.kubectl}",
    "${module.controller_ignition_files.k8s_addons}",
    "${module.controller_ignition_files.sourced_ps1}",
    "${data.ignition_file.etcd__etcd_client_ca___crt.id}",
    "${data.ignition_file.etcd__etcd_client___crt.id}",
    "${data.ignition_file.etcd__etcd_client___key.id}",
    "${data.ignition_file.etcd__etcd__server_ca___crt.id}",
    "${data.ignition_file.etcd__etcd__server___crt.id}",
    "${data.ignition_file.etcd__etcd__server___key.id}",
    "${data.ignition_file.etcd__etcd__peer_ca___crt.id}",
    "${data.ignition_file.etcd__etcd__peer___crt.id}",
    "${data.ignition_file.etcd__etcd__peer___key.id}",
    "${data.ignition_file.kubeconfig.id}",
    "${module.bootkube_assets.assets}",
  ]
  users = [
    "${module.ignition_users.all}",
  ]
}

module "controller_ignition_networkd" {
  source                     = "../ignition/networkd"
  server_count               = "${length(var.controller_domains)}"
  internal_interfaces        = "${var.controller_internal_interfaces}"
  internal_mtu_bytes         = "1500"
  enable_external_interfaces = false
}

module "controller_ignition_systemd" {
  source                 = "../ignition/systemd"
  filesystem_type        = "xfs"
  controller_domains     = ["${var.controller_domains}"]
  cluster_domain_suffix  = "${var.cluster_domain_suffix}"
  k8s_dns_service_ip     = "${module.bootkube.kube_dns_service_ip}"
  haproxy_apiserver_port = "${var.external_apiserver_port}"
  haproxy_stats_port     = "9000"
  etcd_data_dir          = "/ssd-internal/etcd"
}

module "controller_ignition_files" {
  source                       = "../ignition/files"
  kubelet_image_tag            = "${var.kubelet_image_tag}"
  domains                      = ["${var.controller_domains}"]
  controller_domains           = ["${var.controller_domains}"]
  keepalived_virtual_ipaddress = "${var.k8s_ip}"
  keepalived_interface         = "internal0"
  k8s_apiserver_port           = "${var.internal_apiserver_port}"
  haproxy_apiserver_port       = "${var.external_apiserver_port}"
  haproxy_stats_port           = "9000"
}

module "ignition_users" {
  source = "../ignition/users"
}

module "bootkube_assets" {
  source        = "bootkube-assets"
  create_assets = "${var.create_bootkube_assets_ignition_files}"
}
