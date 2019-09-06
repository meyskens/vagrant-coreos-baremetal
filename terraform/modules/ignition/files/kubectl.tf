data "ignition_file" "kubectl" {
  filesystem = "root"
  path       = "/opt/kubernetes/bin/kubectl"
  mode       = "0755"

  source {
    source       = "https://storage.googleapis.com/kubernetes-release/release/${var.kubectl_version}/bin/linux/amd64/kubectl"
    verification = "sha512-${var.kubectl_sha512}"
  }
}

output "kubectl" {
  value = "${data.ignition_file.kubectl.id}"
}
