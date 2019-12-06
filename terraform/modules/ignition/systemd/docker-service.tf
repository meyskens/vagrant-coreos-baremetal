data "ignition_systemd_unit" "docker_service" {
  name    = "docker.service"
  enabled = true

  dropin {
    name    = "10-dockeropts.conf"
    content = "${file("${path.module}/files/10-dockeropts.conf")}"
  }
}

output "docker_service" {
  value = "${data.ignition_systemd_unit.docker_service.id}"
}
