# Creates private_lan
resource "openstack_networking_network_v2" "network" {
  name = "${var.lan["name"]}"
  admin_state_up = "true"
  region = "${var.region}"
}

# Assign subnet to it
resource "openstack_networking_subnet_v2" "subnet" {
  network_id = "${openstack_networking_network_v2.network.id}"
  name = "${var.lan["name"]}"
  cidr = "${var.lan["cidr"]}"
  ip_version = 4
  region = "${var.region}"
  dns_nameservers = [
      "188.93.16.19",
      "188.93.17.19",
      "109.234.159.91"
  ]
}

# Creates gateway with external net
resource "openstack_networking_router_v2" "router" {
  name = "router"
  # Static id for selectel external-network
  external_gateway = "${var.external_gateway}"
  region = "${var.region}"
}

# Attach our network to gateway
resource "openstack_networking_router_interface_v2" "router" {
  region = "${var.region}"
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet.id}"
}
