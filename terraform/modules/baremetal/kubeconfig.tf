data "ignition_file" "kubeconfig" {
  filesystem = "root"
  path       = "/etc/kubernetes/kubeconfig"
  mode       = "0644"

  content {
    content = "${module.bootkube.kubeconfig}"
  }
}
