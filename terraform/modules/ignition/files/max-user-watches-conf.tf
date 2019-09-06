data "ignition_file" "max_user_watches_conf" {
  filesystem = "root"
  path       = "/etc/sysctl.d/max-user-watches.conf"
  mode       = "0644"

  content {
    content = "${file("${path.module}/files/max-user-watches.conf")}"
  }
}

output "max_user_watches_conf" {
  value = "${data.ignition_file.max_user_watches_conf.id}"
}
