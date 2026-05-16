# Get information about the current client configuration
data "azurerm_client_config" "current" {}

# Get information about the current subscription
data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.environment}-resources" # <-- update value here
  location = var.location                   # <-- update value here

  tags = local.common_tags
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.environment}-network" # <-- update value here
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = var.vnet_address_space # <-- update value here

  tags = local.common_tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnet_configuration
  name                 = each.key # <-- update value here
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [each.value] # <-- update value here
}