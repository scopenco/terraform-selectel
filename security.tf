resource "openstack_compute_keypair_v2" "myproject" {
  name       = "myproject"
  region     = "${var.region}"
  public_key = "${var.project_ssh_pubkey}"
}
