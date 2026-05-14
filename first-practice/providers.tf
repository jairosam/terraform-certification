terraform {
  required_version = "1.12.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.72.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "stacterraformcoursejairo"
    container_name       = "tfstate2"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}