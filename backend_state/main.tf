data "azurerm_subscription" "current" {}

data "azurerm_location" "current" {
  location = "eastus"
}

locals {
  tags = {
    Name            = "terraform-course"
    Environment     = var.environment
    Managed_By      = "Terraform"
    Subscription_Id = data.azurerm_subscription.current.subscription_id
  }
}

resource "azurerm_resource_group" "main" {
  name     = "terraform-course"
  location = data.azurerm_location.current.display_name
}

resource "azurerm_virtual_network" "azure_vnet" {
  name                = "vnet-terraform-course"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  address_space = var.vnet_address_space

  tags = local.tags

}

resource "azurerm_subnet" "web" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.azure_vnet.name
  address_prefixes     = [var.subnet_web_cidr]

}

resource "azurerm_subnet" "app" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.azure_vnet.name
  address_prefixes     = [var.subnet_app_cidr]
}