data "ignition_disk" "sda" {
  wipe_table = "${var.wipe_controller_filesystems}"
  device     = "/dev/sda"

  partition {
    label = "raid.1.1"
    start = 2048
    size  = 62914560   # 30 GB
  }

  partition {
    start = 0 # First available sector
    size  = 0 # Fill disk
  }
}

data "ignition_disk" "sdb" {
  wipe_table = "${var.wipe_controller_filesystems}"
  device     = "/dev/sdb"

  partition {
    label = "raid.1.2"
    start = 2048
    size  = 62914560   # 30 GB
  }

  partition {
    start = 0 # First available sector
    size  = 0 # Fill disk
  }
}

data "ignition_disk" "sdc" {
  wipe_table = "${var.wipe_controller_filesystems}"
  device     = "/dev/sdc"

  partition {
    label = "raid.1.3"
    start = 2048
    size  = 62914560   # 30 GB
  }

  partition {
    start = 0 # First available sector
    size  = 0 # Fill disk
  }
}

data "ignition_disk" "sdd" {
  wipe_table = "${var.wipe_controller_filesystems}"
  device     = "/dev/sdd"

  partition {
    label = "SSD-INTERNAL"
    start = 2048
    size  = 62914560   # 30 GB
  }

  partition {
    label = "SSD-SCRATCH"
    start = 0 # First available sector
    size  = 0 # Fill disk
  }
}

data "ignition_raid" "md0" {
  name  = "md0"
  level = "raid1"

  devices = [
    "/dev/disk/by-partlabel/raid.1.1",
    "/dev/disk/by-partlabel/raid.1.2",
    "/dev/disk/by-partlabel/raid.1.3",
  ]
}

data "ignition_filesystem" "data" {
  name = "data"

  mount {
    device          = "/dev/md/md0"
    format          = "xfs"
    wipe_filesystem = "${var.wipe_controller_filesystems}"
    label           = "DATA"
  }
}

data "ignition_filesystem" "data_a" {
  name = "data-a"

  mount {
    device          = "/dev/sda2"
    format          = "xfs"
    wipe_filesystem = "${var.wipe_controller_filesystems}"
    label           = "DATAA"
  }
}

data "ignition_filesystem" "data_b" {
  name = "data-b"

  mount {
    device          = "/dev/sdb2"
    format          = "xfs"
    wipe_filesystem = "${var.wipe_controller_filesystems}"
    label           = "DATAB"
  }
}

data "ignition_filesystem" "data_c" {
  name = "data-c"

  mount {
    device          = "/dev/sdc2"
    format          = "xfs"
    wipe_filesystem = "${var.wipe_controller_filesystems}"
    label           = "DATAC"
  }
}

