provider "openstack" {
  domain_name = "<CLIENT_LOGIN>"
  auth_url    = "https://api.selvpc.ru/identity/v3"
  tenant_name = "<TENANT_ID>"
  tenant_id   = "<TENANT_ID>"
  user_name   = "<USER_NAME>"
  password    = "<USER_PASSWORD>"
}
