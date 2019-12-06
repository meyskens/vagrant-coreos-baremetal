data "ignition_file" "sourced_ps1" {
  filesystem = "root"
  path       = "/etc/profile.d/sourced-ps1.sh"
  mode       = "0755"

  content {
    content = "${file("${path.module}/files/sourced-ps1.sh")}"
  }
}

output "sourced_ps1" {
  value = "${data.ignition_file.sourced_ps1.id}"
}
