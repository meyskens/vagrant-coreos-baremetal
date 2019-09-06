# These are needed to import in the deployment resources
output "k8s_apiserver_domain" {
  value = "${var.k8s_domain_name}"
}

output "k8s_apiserver_port" {
  value = "${var.external_apiserver_port}"
}

output "k8s_ca_cert" {
  value = "${module.bootkube.ca_cert}"
}

output "k8s_cert" {
  value = "${module.bootkube.kubelet_cert}"
}

output "k8s_key" {
  value = "${module.bootkube.kubelet_key}"
}

output "cluster_name" {
  value = "${var.cluster_name}"
}

output "etcd_client_ca" {
  value = "${module.bootkube.etcd_ca_cert}"
}

output "etcd_client_ca_cert" {
  value = "${module.bootkube.etcd_ca_cert}"
}

output "etcd_client_cert" {
  value = "${module.bootkube.etcd_client_cert}"
}

output "etcd_client_key" {
  value = "${module.bootkube.etcd_client_key}"
}
