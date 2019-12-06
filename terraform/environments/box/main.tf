module "production_cluster" {
  source                 = "../../modules/baremetal"
  cluster_name           = "box"
  matchbox_http_endpoint = "matchbox.infra.box.srcd.local:8080"
  matchbox_rpc_endpoint  = "matchbox.infra.box.srcd.local:8081"
  k8s_ip                 = "10.20.10.10"
  k8s_domain_name        = "kube-apiserver.k8s.box.srcd.local"

  ca_certificate = "${file("../../../certificates/ca/combined-ca.crt")}"
  ca_private_key = "${file("../../../certificates/ca/signing-ca/private/signing-ca-unencrypted.key")}"

  # This is strictured this way to emulate the output of the online.net provider which is used the modules
  controller_internal_interfaces = [
    {
      "mac" = "08:00:27:00:00:01"
    },
    {
      "mac" = "08:00:27:00:00:02"
    },
    {
      "mac" = "08:00:27:00:00:03"
    },
  ]

  controller_internal_ips = [
    "10.20.10.11",
    "10.20.10.12",
    "10.20.10.13",
  ]

  controller_domains = [
    "controller-1.k8s.box.srcd.local",
    "controller-2.k8s.box.srcd.local",
    "controller-3.k8s.box.srcd.local",
  ]


  dnsmasq_servers = [
    "provisioner-1.infra.box.srcd.local",
  ]

  # This was set to false the first run to let
  # terraform-render-bootkube *actually* create the assets
  create_bootkube_assets_ignition_files = true

  # This needs to be set to true in order to wipe existing partitions
  wipe_controller_filesystems = false
}
