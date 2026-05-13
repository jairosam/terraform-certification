terraform {
  required_version = "1.12.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.72.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-course"
    storage_account_name = "tfstate-terraformcourse"
    container_name       = "tfstate-terraform"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}