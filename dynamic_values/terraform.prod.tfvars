environment        = "production"
location           = "eastus"
vnet_address_space = ["172.17.0.0/16"]
subnet_configuration = {
  "subnet_1" = "172.17.1.0/24",
  "subnet_2" = "172.17.2.0/24",
  "subnet_3" = "172.17.3.0/24"
}
project_name = "production-infrastructure"
storage_account_names = ["stacprod1", "stacprod2"]