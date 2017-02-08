resource "openstack_blockstorage_volume_v2" "db1" {
  name        = "db1"
  size        = "5" #Gb
  volume_type = "fast.${var.region}a"
  image_id    = "${var.images["centos-7-x64"]}"
  region      = "${var.region}"

  lifecycle {
    ignore_changes = ["name"]
  }
}

resource "openstack_compute_instance_v2" "db1" {
  name      = "db1"
  flavor_id = "${var.flavors["flavor-1024-1-private"]}"
  region    = "${var.region}"
  key_pair  = "myproject"

  network {
    name = "${var.lan["name"]}"
    fixed_ip_v4 = "192.168.0.6"
  }

  metadata {
    type = "db1"
  }

  block_device {
    uuid             = "${openstack_blockstorage_volume_v2.db1.id}"
    source_type      = "volume"
    boot_index       = 0
    destination_type = "volume"
  }

  lifecycle {
    ignore_changes = ["name", "block_device"]
    prevent_destroy = true
  }
}

output "db1 ip" {
    value = "${openstack_compute_instance_v2.db1.network.0.fixed_ip_v4}"
}
