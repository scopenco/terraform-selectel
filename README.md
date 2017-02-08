# Terraform example for Selectel VPC

Example based on simple web stack: frontend/backend/database.

* be1.tf - backend instance
* db1.tf - database instance
* fe1.tf - frontend instance
* networking.tf - network configuration file
* provider.tf - provider credentials
* security.tf - security settings
* variables.tf - variables used in other configuration file

### Usage
* Install OpenStack Tools from https://support.selectel.ru/vpc/access/
* Create flavors `flavor-1024-1-public` and `flavor-1024-1-private`
```
nova flavor-create flavor-1024-1-public auto 1024 0 1
nova flavor-create flavor-1024-1-private auto 1024 0 1 --is-public false
```
* Get image IDs and update variables.tf
```
nova image-list
```
* Get gateway ID and update variables.tf
```
neutron net-list | grep external-network
```
* Set provider settings in provider.tf
* Run `terraform apply`
* Profit
