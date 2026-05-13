data "azurerm_subscription" "current" {}

data "azurerm_location" "current" {
  location = "eastus"
}

locals {
  tags = {
    Name            = "terraform-course"
    Environment     = var.environment
    Managed_By      = "Terraform"
    Subscription_Id = data.azurerm_subscription.current.subscription_id
  }
}

resource "azurerm_resource_group" "main" {
  name     = "terraform-course"
  location = data.azurerm_location.current.display_name
}

resource "azurerm_virtual_network" "azure_vnet" {
  name                = "vnet-terraform-course"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  address_space = var.vnet_address_space

  tags = local.tags

}

resource "azurerm_subnet" "web" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.azure_vnet.name
  address_prefixes     = [var.subnet_web_cidr]

}

resource "azurerm_subnet" "app" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.azure_vnet.name
  address_prefixes     = [var.subnet_app_cidr]
}

resource "azurerm_network_security_group" "nsg_rules_web" {
  name                = "web-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = local.tags
}

resource "azurerm_network_security_group" "nsg_rules_app" {
  name                = "app-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = local.tags
}

resource "azurerm_network_security_rule" "web_http" {
  name                        = "web-http"
  network_security_group_name = azurerm_network_security_group.nsg_rules_web.name
  resource_group_name         = azurerm_resource_group.main.name
  protocol                    = "Tcp"
  direction                   = "Inbound"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  access                      = "Allow"
  priority                    = 1000
}

resource "azurerm_network_security_rule" "web_https" {
  name                        = "web-https"
  network_security_group_name = azurerm_network_security_group.nsg_rules_web.name
  resource_group_name         = azurerm_resource_group.main.name
  protocol                    = "Tcp"
  direction                   = "Inbound"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  access                      = "Allow"
  priority                    = 800
}

resource "azurerm_network_security_rule" "app_internal" {
  name                        = "app-internal"
  network_security_group_name = azurerm_network_security_group.nsg_rules_app.name
  resource_group_name         = azurerm_resource_group.main.name
  protocol                    = "Tcp"
  direction                   = "Inbound"
  source_address_prefix       = var.subnet_web_cidr
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "8080"
  access                      = "Allow"
  priority                    = 1000
}

resource "azurerm_subnet_network_security_group_association" "web_nsg_association" {
  subnet_id                 = azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.nsg_rules_web.id
}

resource "azurerm_subnet_network_security_group_association" "app_nsg_association" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.nsg_rules_app.id
}
