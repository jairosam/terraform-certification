terraform {
  required_providers {
    azurerm = {
			source  = "hashicorp/azurerm"
			version = "~> 4.72.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "azure_vnet_cidr" {
	type = string
	default = "10.10.0.0/22"
}

resource "azurerm_resource_group" "rg_test" {
	name = "rg-test"
	location = "eastus"
}

resource "azurerm_virtual_network" "vnet_test" {
	name = "vnet-test"
	location = azurerm_resource_group.rg_test.location
	resource_group_name = azurerm_resource_group.rg_test.name
	address_space = [ var.azure_vnet_cidr ]
}

resource "azurerm_subnet" "subnet_test_1" {
	name = "subnet-test-1"
	virtual_network_name = azurerm_virtual_network.vnet_test.name
	resource_group_name = azurerm_resource_group.rg_test.name
	address_prefixes = [ cidrsubnet(var.azure_vnet_cidr, 2, 0) ]
}

resource "azurerm_subnet" "subnet_test_2" {
	name = "subnet-test-2"
	virtual_network_name = azurerm_virtual_network.vnet_test.name
	resource_group_name = azurerm_resource_group.rg_test.name
	address_prefixes = [ cidrsubnet(var.azure_vnet_cidr, 3, 1) ]
}