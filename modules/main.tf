data "azurerm_location" "current" {
  location = "eastus"
}

module "resource_group" {
  source   = "./resource_group"
  name     = "test-resource-group"
  location = data.azurerm_location.current.display_name
  tags = {
    environment = "dev"
    project     = "terraform-labs"
  }
}

module "nsg" {
  source  = "Azure/network-security-group/azurerm"
  version = "4.1.0"

  resource_group_name = module.resource_group.rg_name
}