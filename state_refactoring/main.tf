variable "subscription_id" {
	description = "The subscription ID where the resources are located."
	type        = string
}

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

#resource "azurerm_subnet" "subnet_1" {
#	name = "subnet-1"
#	virtual_network_name = azurerm_virtual_network.vnet_test_1.name
#	resource_group_name = azurerm_resource_group.rg_1.name
#	address_prefixes = [ "10.10.1.0/24" ]
#}

resource "azurerm_subnet" "subnet_2" {
	name = "subnet-2"
	virtual_network_name = azurerm_virtual_network.vnet_2.name
	resource_group_name = azurerm_resource_group.rg_1.name
	address_prefixes = [ "10.20.1.0/24" ]
}

removed {
	from = azurerm_subnet.subnet_1
	lifecycle {
		destroy = false
	}
}

resource "azurerm_subnet" "subnet_3" {
	name = "subnet-3"
	virtual_network_name = azurerm_virtual_network.vnet_test_1.name
	resource_group_name = azurerm_resource_group.rg_1.name
	address_prefixes = [ "10.10.2.0/24" ]
}

resource "azurerm_subnet" "subnet_4" {
  address_prefixes                              = ["10.20.2.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "subnet-4"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = "rg-1"
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = null
  virtual_network_name                          = "vnet-2"
}

#import {
#	to = azurerm_subnet.subnet_4
#	id = "/subscriptions/${var.subscription_id}/resourceGroups/rg-1/providers/Microsoft.Network/virtualNetworks/vnet-2/subnets/subnet-4"
#}