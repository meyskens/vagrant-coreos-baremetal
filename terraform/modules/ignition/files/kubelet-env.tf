data "template_file" "kubelet_env" {
  template = "${file("${path.module}/files/kubelet.env.tpl")}"

  vars {
    kubelet_image_tag = "${var.kubelet_image_tag}"
  }
}

data "ignition_file" "kubelet_env" {
  filesystem = "root"
  path       = "/etc/kubernetes/kubelet.env"
  mode       = "0644"

  content {
    content = "${data.template_file.kubelet_env.rendered}"
  }
}

output "kubelet_env" {
  value = "${data.ignition_file.kubelet_env.id}"
}
