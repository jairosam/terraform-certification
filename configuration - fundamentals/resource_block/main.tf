resource "azurerm_resource_group" "resource_group_1" {
  name     = "rg-resource-block-1"
  location = "eastus"
	
  tags = { 
    "environment" = "test"
	}
}