data "ignition_user" "vagrant" {
  name                = "vagrant"
  ssh_authorized_keys = [""]
  groups              = ["sudo", "docker"]
  password_hash       = "$6$rounds=4096$m3arTDlVWwc$cbIyvUA8rL3bK5Z.qOIpQCgWfsUZ5ITpZJ0vWTaAjjMNzMEGi7apjyYkTaXO.IQTuM0asl/Q.EINDr9dXVfFR0" #vagrant
}

output "vagrant" {
  value = "${data.ignition_user.vagrant.id}"
}

output "all" {
  value = [
    "${data.ignition_user.vagrant.id}",
  ]
}
