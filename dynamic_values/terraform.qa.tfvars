environment        = "quality"
location           = "eastus"
vnet_address_space = ["172.16.0.0/16"]
subnet_configuration = {
  "subnet_1" = "172.16.1.0/24",
  "subnet_2" = "172.16.2.0/24",
  "subnet_3" = "172.16.3.0/24"
}
project_name = "quality-infrastructure"
storage_account_names = ["stactest1", "stactest2"]