data "ignition_file" "bootkube_start" {
  filesystem = "root"
  path       = "/opt/bootkube/bootkube-start"
  mode       = "0544"

  content {
    content = "${file("${path.module}/files/bootkube-start")}"
  }
}

output "bootkube_start" {
  value = "${data.ignition_file.bootkube_start.id}"
}
