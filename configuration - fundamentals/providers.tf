terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.72.0"
    }
  }
}

provider "azurerm" { # default provider
  subscription_id = var.subscription_id_2
  tenant_id       = var.tenant_id
  features {}
}

provider "azurerm" {
  alias           = "azure_sub1"
  subscription_id = var.subscription_id_1
  tenant_id       = var.tenant_id
  features {}
}