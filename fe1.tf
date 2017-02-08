resource "openstack_blockstorage_volume_v2" "fe1" {
  name        = "fe1"
  size        = "5" #Gb
  volume_type = "fast.${var.region}a"
  image_id    = "${var.images["centos-7-x64"]}"
  region      = "${var.region}"

  lifecycle {
    ignore_changes = ["name"]
  }
}

resource "openstack_compute_instance_v2" "fe1" {
  name      = "fe1"
  flavor_id = "${var.flavors["flavor-1024-1-public"]}"
  region    = "${var.region}"
  key_pair  = "myproject"

  network {
    name = "${var.lan["name"]}"
    floating_ip = "<FLOATING_IP>"
    fixed_ip_v4 = "192.168.0.4"
  }

  metadata {
    type = "fe1"
  }

  block_device {
    uuid             = "${openstack_blockstorage_volume_v2.fe1.id}"
    source_type      = "volume"
    boot_index       = 0
    destination_type = "volume"
  }

  lifecycle {
    ignore_changes = ["name", "block_device"]
    prevent_destroy = true
  }
}

output "fe1 ip" {
    value = "${openstack_compute_instance_v2.fe1.network.0.floating_ip} ${openstack_compute_instance_v2.fe1.network.0.fixed_ip_v4}"
}
