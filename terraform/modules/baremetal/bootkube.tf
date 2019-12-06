# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/src-d/terraform-render-bootkube.git?ref=64950d508b0005936544aecb356449bec513dd72"

  cluster_name                    = "${var.cluster_name}"
  api_servers                     = ["${var.k8s_domain_name}"]
  etcd_servers                    = ["${var.controller_domains}"]
  asset_dir                       = "${path.module}/bootkube-assets/files"
  networking                      = "calico"
  network_mtu                     = "1450"
  network_ip_autodetection_method = "first-found"
  pod_cidr                        = "10.2.0.0/16"
  service_cidr                    = "10.3.0.0/16"
  cluster_domain_suffix           = "cluster.local"
  ca_certificate                  = "${var.ca_certificate}"
  ca_private_key                  = "${var.ca_private_key}"
  ca_key_alg                      = "${var.ca_key_alg}"
  apiserver_port                  = "${var.internal_apiserver_port}"
  server_port                     = "${var.external_apiserver_port}"

  container_images = {
    hyperkube        = "k8s.gcr.io/hyperkube:${var.kubelet_image_tag}"
    calico           = "quay.io/calico/node:v3.2.3"
    calico_cni       = "quay.io/calico/cni:v3.2.3"
    flannel          = "quay.io/coreos/flannel:v0.10.0-amd64"
    flannel_cni      = "quay.io/coreos/flannel-cni:v0.3.0"
    coredns          = "k8s.gcr.io/coredns:1.2.2"
    pod_checkpointer = "quay.io/coreos/pod-checkpointer:9dc83e1ab3bc36ca25c9f7c18ddef1b91d4a0558"
  }
}
