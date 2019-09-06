data "ignition_file" "check_tcp_port" {
  filesystem = "root"
  path       = "/opt/check-tcp-port"
  mode       = "0500"

  content {
    content = "${file("${path.module}/files/check-tcp-port")}"
  }
}

output "check_tcp_port" {
  value = "${data.ignition_file.check_tcp_port.id}"
}
