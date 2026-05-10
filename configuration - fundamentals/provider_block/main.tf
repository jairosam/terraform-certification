resource "azurerm_resource_group" "rgs_sub_1" {
  for_each = var.rg_sub_1
  provider = azurerm.azure_sub1
  name     = each.value
  location = "eastus"
}

resource "azurerm_resource_group" "rgs_sub_2" {
  for_each = var.rg_sub_2
  name     = each.value
  location = "eastus"
}