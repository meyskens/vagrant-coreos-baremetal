data "ignition_file" "k8s_addons" {
  filesystem = "root"
  path       = "/opt/k8s-addons"
  mode       = "0755"

  content {
    content = "${file("${path.module}/files/k8s-addons")}"
  }
}

output "k8s_addons" {
  value = "${data.ignition_file.k8s_addons.id}"
}
