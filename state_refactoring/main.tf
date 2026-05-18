resource "azurerm_resource_group" "rg_1" {
	name     = "rg-1"
	location = "eastus"
}

moved {
	from = azurerm_virtual_network.vnet_1
	to = azurerm_virtual_network.vnet_test_1
}

resource "azurerm_virtual_network" "vnet_test_1" {
	name = "vnet-1"
	address_space = [ "10.10.0.0/16" ]
	resource_group_name = azurerm_resource_group.rg_1.name
	location = azurerm_resource_group.rg_1.location
}

resource "azurerm_virtual_network" "vnet_2" {
	name = "vnet-2"
	address_space = [ "10.20.0.0/16" ]
	resource_group_name = azurerm_resource_group.rg_1.name
	location = azurerm_resource_group.rg_1.location
}