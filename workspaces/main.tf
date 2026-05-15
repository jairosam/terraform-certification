data "azurerm_location" "eastus" {
	location = "eastus"
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg_base" {
  name = "${terraform.workspace}-rg"
	location = data.azurerm_location.eastus.display_name
}

resource "azurerm_key_vault" "keyvault" {
	name                        = "${terraform.workspace}-kv"
	location                    = azurerm_resource_group.rg_base.location
	resource_group_name         = azurerm_resource_group.rg_base.name
	tenant_id                   = data.azurerm_client_config.current.tenant_id
	sku_name                    = "standard"
	purge_protection_enabled    = true
}