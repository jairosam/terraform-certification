## Terraform block defines
## 1. Version of Terraform required to run the configuration
## 2. Required providers and their versions
## 3. Backend configuration (not covered in this lab)

## Version constraints for Terraform and providers
## = Only allow this specific version - you want to use exact version when you need abosolute control and consistency
## >= Allow this version and any newer version - you want to ensyre a minimum version and you're comfortable with newer versions that may include new features and bug fixes
## ~> Allow this version and any newer version that does not change the first non-zero digit (e.g. 1.2.3 allows 1.2.4 and 1.2.5 but not 1.3.0) - you want to update for patches but you want to review minor and major versions manually

terraform {
  required_version = "~> 1.12.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.72.0"
    }
  }
}

resource "azurerm_resource_group" "resource_group_1" {
  name     = "rg-resource-${var.environment}-1"
  location = "eastus"

  tags = var.tags
}

resource "azurerm_virtual_network" "virtual_network_1" {
  name                = "vnet-resource-block-${var.environment}-1"
  location            = azurerm_resource_group.resource_group_1.location
  resource_group_name = azurerm_resource_group.resource_group_1.name

  address_space = ["10.40.0.0/22"]
}

resource "azurerm_subnet" "subnet_1" {
  name                 = "subnet-resource-block-${var.environment}-1"
  resource_group_name  = azurerm_resource_group.resource_group_1.name
  virtual_network_name = azurerm_virtual_network.virtual_network_1.name
  address_prefixes     = ["10.40.0.0/26"]
}

data "azurerm_subnet" "subnet_created_manually" {
	name = "subnet-created-${var.environment}-manually"
	resource_group_name  = azurerm_resource_group.resource_group_1.name
	virtual_network_name = azurerm_virtual_network.virtual_network_1.name
}

resource "azurerm_network_security_group" "nsg_resource_block_1" {
	name = "nsg-resource-block-${var.environment}-1"
	resource_group_name = azurerm_resource_group.resource_group_1.name
	location = azurerm_resource_group.resource_group_1.location
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
	subnet_id = data.azurerm_subnet.subnet_created_manually.id
	network_security_group_id = azurerm_network_security_group.nsg_resource_block_1.id
}