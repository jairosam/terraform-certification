data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "rg-independent" {
  name     = "test-resource-group-independent"
  location = "eastus"
  tags = {
    environment = "dev"
    project     = "terraform-labs"
  }

  lifecycle {
    postcondition {
      condition     = location == "eastus"
      error_message = "this is a postcondition"
    }
  }

}

resource "azurerm_resource_group" "rg-dependent" {
  name     = "test-resource-group-dependent"
  location = "eastus"
  tags = {
    environment = "dev"
    project     = "terraform-labs"
    subscription_id = data.azurerm_subscription.current.subscription_id
  }

  depends_on = [azurerm_resource_group.rg-independent]

  lifecycle {
    ignore_changes        = [tags]
    create_before_destroy = true
    precondition {
      condition     = contains(["eastus", "westus"], location)
      error_message = "Resource group location must be eastus or westus"
    }
  }
}