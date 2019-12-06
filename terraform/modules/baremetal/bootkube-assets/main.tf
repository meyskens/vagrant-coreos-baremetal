# Created using create-assets-tf-file.py

data "ignition_file" "auth__kubeconfig" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/auth/kubeconfig"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/auth/kubeconfig")}"
  }
}

data "ignition_file" "auth__box_config" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/auth/box-config"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/auth/box-config")}"
  }
}

data "ignition_file" "bootstrap_manifests__bootstrap_apiserver___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/bootstrap-manifests/bootstrap-apiserver.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/bootstrap-manifests/bootstrap-apiserver.yaml")}"
  }
}

data "ignition_file" "bootstrap_manifests__bootstrap_controller_manager___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/bootstrap-manifests/bootstrap-controller-manager.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/bootstrap-manifests/bootstrap-controller-manager.yaml")}"
  }
}

data "ignition_file" "bootstrap_manifests__bootstrap_scheduler___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/bootstrap-manifests/bootstrap-scheduler.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/bootstrap-manifests/bootstrap-scheduler.yaml")}"
  }
}

data "ignition_file" "manifests__kube_apiserver_secret___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-apiserver-secret.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-apiserver-secret.yaml")}"
  }
}

data "ignition_file" "manifests__kube_apiserver___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-apiserver.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-apiserver.yaml")}"
  }
}

data "ignition_file" "manifests__kube_controller_manager_disruption___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-controller-manager-disruption.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-controller-manager-disruption.yaml")}"
  }
}

data "ignition_file" "manifests__kube_controller_manager_role_binding___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-controller-manager-role-binding.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-controller-manager-role-binding.yaml")}"
  }
}

data "ignition_file" "manifests__kube_controller_manager_sa___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-controller-manager-sa.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-controller-manager-sa.yaml")}"
  }
}

data "ignition_file" "manifests__kube_controller_manager_secret___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-controller-manager-secret.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-controller-manager-secret.yaml")}"
  }
}

data "ignition_file" "manifests__kube_controller_manager___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-controller-manager.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-controller-manager.yaml")}"
  }
}

data "ignition_file" "manifests__kube_proxy_role_binding___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-proxy-role-binding.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-proxy-role-binding.yaml")}"
  }
}

data "ignition_file" "manifests__kube_proxy_sa___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-proxy-sa.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-proxy-sa.yaml")}"
  }
}

data "ignition_file" "manifests__kube_proxy___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-proxy.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-proxy.yaml")}"
  }
}

data "ignition_file" "manifests__kube_scheduler_disruption___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-scheduler-disruption.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-scheduler-disruption.yaml")}"
  }
}

data "ignition_file" "manifests__kube_scheduler___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-scheduler.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-scheduler.yaml")}"
  }
}

data "ignition_file" "manifests__kube_system_rbac_role_binding___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kube-system-rbac-role-binding.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kube-system-rbac-role-binding.yaml")}"
  }
}

data "ignition_file" "manifests__kubeconfig_in_cluster___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/kubeconfig-in-cluster.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/kubeconfig-in-cluster.yaml")}"
  }
}

data "ignition_file" "manifests__pod_checkpointer_role_binding___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/pod-checkpointer-role-binding.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/pod-checkpointer-role-binding.yaml")}"
  }
}

data "ignition_file" "manifests__pod_checkpointer_role___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/pod-checkpointer-role.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/pod-checkpointer-role.yaml")}"
  }
}

data "ignition_file" "manifests__pod_checkpointer_sa___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/pod-checkpointer-sa.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/pod-checkpointer-sa.yaml")}"
  }
}

data "ignition_file" "manifests__pod_checkpointer___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/pod-checkpointer.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/pod-checkpointer.yaml")}"
  }
}

data "ignition_file" "manifests__coredns__cluster_role_binding___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/coredns/cluster-role-binding.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/coredns/cluster-role-binding.yaml")}"
  }
}

data "ignition_file" "manifests__coredns__cluster_role___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/coredns/cluster-role.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/coredns/cluster-role.yaml")}"
  }
}

data "ignition_file" "manifests__coredns__config___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/coredns/config.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/coredns/config.yaml")}"
  }
}

data "ignition_file" "manifests__coredns__deployment___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/coredns/deployment.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/coredns/deployment.yaml")}"
  }
}

data "ignition_file" "manifests__coredns__service_account___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/coredns/service-account.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/coredns/service-account.yaml")}"
  }
}

data "ignition_file" "manifests__coredns__service___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests/coredns/service.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests/coredns/service.yaml")}"
  }
}

data "ignition_file" "manifests_networking__bgpconfigurations_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/bgpconfigurations-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/bgpconfigurations-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__bgppeers_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/bgppeers-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/bgppeers-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__calico___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/calico.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/calico.yaml")}"
  }
}

data "ignition_file" "manifests_networking__cluster_role_binding___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/cluster-role-binding.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/cluster-role-binding.yaml")}"
  }
}

data "ignition_file" "manifests_networking__cluster_role___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/cluster-role.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/cluster-role.yaml")}"
  }
}

data "ignition_file" "manifests_networking__clusterinformations_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/clusterinformations-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/clusterinformations-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__config___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/config.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/config.yaml")}"
  }
}

data "ignition_file" "manifests_networking__felixconfigurations_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/felixconfigurations-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/felixconfigurations-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__globalnetworkpolicies_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/globalnetworkpolicies-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/globalnetworkpolicies-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__globalnetworksets_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/globalnetworksets-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/globalnetworksets-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__hostendpoints_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/hostendpoints-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/hostendpoints-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__ippools_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/ippools-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/ippools-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__networkpolicies_crd___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/networkpolicies-crd.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/networkpolicies-crd.yaml")}"
  }
}

data "ignition_file" "manifests_networking__service_account___yaml" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/manifests-networking/service-account.yaml"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/manifests-networking/service-account.yaml")}"
  }
}

data "ignition_file" "tls__apiserver___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/apiserver.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/apiserver.crt")}"
  }
}

data "ignition_file" "tls__apiserver___key" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/apiserver.key"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/apiserver.key")}"
  }
}

data "ignition_file" "tls__ca___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/ca.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/ca.crt")}"
  }
}

data "ignition_file" "tls__ca___key" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/ca.key"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/ca.key")}"
  }
}

data "ignition_file" "tls__etcd_client_ca___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd-client-ca.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd-client-ca.crt")}"
  }
}

data "ignition_file" "tls__etcd_client___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd-client.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd-client.crt")}"
  }
}

data "ignition_file" "tls__etcd_client___key" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd-client.key"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd-client.key")}"
  }
}

data "ignition_file" "tls__kubelet___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/kubelet.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/kubelet.crt")}"
  }
}

data "ignition_file" "tls__kubelet___key" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/kubelet.key"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/kubelet.key")}"
  }
}

data "ignition_file" "tls__service_account___key" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/service-account.key"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/service-account.key")}"
  }
}

data "ignition_file" "tls__service_account___pub" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/service-account.pub"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/service-account.pub")}"
  }
}

data "ignition_file" "tls__etcd__peer_ca___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd/peer-ca.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd/peer-ca.crt")}"
  }
}

data "ignition_file" "tls__etcd__peer___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd/peer.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd/peer.crt")}"
  }
}

data "ignition_file" "tls__etcd__peer___key" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd/peer.key"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd/peer.key")}"
  }
}

data "ignition_file" "tls__etcd__server_ca___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd/server-ca.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd/server-ca.crt")}"
  }
}

data "ignition_file" "tls__etcd__server___crt" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd/server.crt"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd/server.crt")}"
  }
}

data "ignition_file" "tls__etcd__server___key" {
  filesystem = "root"
  path       = "/opt/bootkube/assets/tls/etcd/server.key"
  mode       = "0644"
  count      = "${var.create_assets ? 1 : 0}"

  content {
    content = "${file("${path.module}/files/tls/etcd/server.key")}"
  }
}

output "assets" {
  value = [
    "${data.ignition_file.auth__kubeconfig.*.id}",
    "${data.ignition_file.auth__box_config.*.id}",
    "${data.ignition_file.bootstrap_manifests__bootstrap_apiserver___yaml.*.id}",
    "${data.ignition_file.bootstrap_manifests__bootstrap_controller_manager___yaml.*.id}",
    "${data.ignition_file.bootstrap_manifests__bootstrap_scheduler___yaml.*.id}",
    "${data.ignition_file.manifests__kube_apiserver_secret___yaml.*.id}",
    "${data.ignition_file.manifests__kube_apiserver___yaml.*.id}",
    "${data.ignition_file.manifests__kube_controller_manager_disruption___yaml.*.id}",
    "${data.ignition_file.manifests__kube_controller_manager_role_binding___yaml.*.id}",
    "${data.ignition_file.manifests__kube_controller_manager_sa___yaml.*.id}",
    "${data.ignition_file.manifests__kube_controller_manager_secret___yaml.*.id}",
    "${data.ignition_file.manifests__kube_controller_manager___yaml.*.id}",
    "${data.ignition_file.manifests__kube_proxy_role_binding___yaml.*.id}",
    "${data.ignition_file.manifests__kube_proxy_sa___yaml.*.id}",
    "${data.ignition_file.manifests__kube_proxy___yaml.*.id}",
    "${data.ignition_file.manifests__kube_scheduler_disruption___yaml.*.id}",
    "${data.ignition_file.manifests__kube_scheduler___yaml.*.id}",
    "${data.ignition_file.manifests__kube_system_rbac_role_binding___yaml.*.id}",
    "${data.ignition_file.manifests__kubeconfig_in_cluster___yaml.*.id}",
    "${data.ignition_file.manifests__pod_checkpointer_role_binding___yaml.*.id}",
    "${data.ignition_file.manifests__pod_checkpointer_role___yaml.*.id}",
    "${data.ignition_file.manifests__pod_checkpointer_sa___yaml.*.id}",
    "${data.ignition_file.manifests__pod_checkpointer___yaml.*.id}",
    "${data.ignition_file.manifests__coredns__cluster_role_binding___yaml.*.id}",
    "${data.ignition_file.manifests__coredns__cluster_role___yaml.*.id}",
    "${data.ignition_file.manifests__coredns__config___yaml.*.id}",
    "${data.ignition_file.manifests__coredns__deployment___yaml.*.id}",
    "${data.ignition_file.manifests__coredns__service_account___yaml.*.id}",
    "${data.ignition_file.manifests__coredns__service___yaml.*.id}",
    "${data.ignition_file.manifests_networking__bgpconfigurations_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__bgppeers_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__calico___yaml.*.id}",
    "${data.ignition_file.manifests_networking__cluster_role_binding___yaml.*.id}",
    "${data.ignition_file.manifests_networking__cluster_role___yaml.*.id}",
    "${data.ignition_file.manifests_networking__clusterinformations_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__config___yaml.*.id}",
    "${data.ignition_file.manifests_networking__felixconfigurations_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__globalnetworkpolicies_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__globalnetworksets_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__hostendpoints_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__ippools_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__networkpolicies_crd___yaml.*.id}",
    "${data.ignition_file.manifests_networking__service_account___yaml.*.id}",
    "${data.ignition_file.tls__apiserver___crt.*.id}",
    "${data.ignition_file.tls__apiserver___key.*.id}",
    "${data.ignition_file.tls__ca___crt.*.id}",
    "${data.ignition_file.tls__ca___key.*.id}",
    "${data.ignition_file.tls__etcd_client_ca___crt.*.id}",
    "${data.ignition_file.tls__etcd_client___crt.*.id}",
    "${data.ignition_file.tls__etcd_client___key.*.id}",
    "${data.ignition_file.tls__kubelet___crt.*.id}",
    "${data.ignition_file.tls__kubelet___key.*.id}",
    "${data.ignition_file.tls__service_account___key.*.id}",
    "${data.ignition_file.tls__service_account___pub.*.id}",
    "${data.ignition_file.tls__etcd__peer_ca___crt.*.id}",
    "${data.ignition_file.tls__etcd__peer___crt.*.id}",
    "${data.ignition_file.tls__etcd__peer___key.*.id}",
    "${data.ignition_file.tls__etcd__server_ca___crt.*.id}",
    "${data.ignition_file.tls__etcd__server___crt.*.id}",
    "${data.ignition_file.tls__etcd__server___key.*.id}",
  ]
}
