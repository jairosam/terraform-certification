resource "azurerm_resource_group" "rg-independent" {
  name     = "test-resource-group-independent"
  location = "eastus"
  tags = {
    environment = "dev"
    project     = "terraform-labs"
  }
}

resource "azurerm_resource_group" "rg-dependent" {
  name     = "test-resource-group-dependent"
  location = "eastus"
  tags = {
    environment = "dev"
    project     = "terraform-labs"
  }

  depends_on = [azurerm_resource_group.rg-independent]

  lifecycle {
    ignore_changes        = [tags]
    create_before_destroy = true
  }
}