variable "project_ssh_pubkey" {
  default = "your ssh public key here"
 description = "Ssh public key used for auth in vps, like ssh -i ssh_private_key root@IP"
}

variable "project_domain" {
  default = "mydomain.com"
  description = "This domain will ba added as part of FQDN in the end of the instance name."
}

variable "region" {
  default = "ru-2"
  description = "Region for instance deployment, get it from env OS_REGION_NAME."
}

variable "external_gateway" {
  default = "8cc4ee6a-8dc9-4865-8877-ef5b5cdef020"
  description = "External network id, used to configure routing. run `neutron net-list | grep external-network` to get the value."
}

variable "lan" {
  type = "map"
  default = {
    "name" = "lan"
    "cidr" = "192.168.0.0/24"
  }
  description = "Private network cidr"
}

variable "images" {
  type = "map"
  default = {
    "centos-7-x64" = "67b05866-b44a-479c-8c0e-52d0a8d2a6ae"
  }
  description = "Image IDs, run `nova image-list` to get full list."
}

variable "flavors" {
  type = "map"
  default = {
    "flavor-1024-1-public" = "58c7b174-b6d8-46fc-81d1-448f264caa09" # nova flavor-create flavor-1024-1-public auto 1024 0 1
    "flavor-1024-1-private" = "e6a052e1-4ec5-442c-9016-dc038d0566d7" # nova flavor-create flavor-1024-1-private auto 1024 0 1 --is-public false
  }
  description = "Flavor IDs, run `nova flavor-list` to get full list."
}
