# Get information about the current client configuration
data "azurerm_client_config" "current" {}

# Get information about the current subscription
data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "production" {
  name     = "${var.environment}-resources" # <-- update value here
  location = var.location                   # <-- update value here

  tags = local.common_tags
}

resource "azurerm_virtual_network" "production" {
  name                = "${var.environment}-network" # <-- update value here
  resource_group_name = azurerm_resource_group.production.name
  location            = azurerm_resource_group.production.location
  address_space       = var.vnet_address_space # <-- update value here

  tags = local.common_tags
}

resource "azurerm_subnet" "dynamic" {
  name                 = "${var.environment}-subnet" # <-- update value here
  resource_group_name  = azurerm_resource_group.production.name
  virtual_network_name = azurerm_virtual_network.production.name
  address_prefixes     = var.subnet_prefix # <-- update value here
}