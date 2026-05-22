data "azurerm_location" "current" {
  location = "westus2"
}

data "azurerm_key_vault" "keyvault" {
  name                = "secrets-jairo-hc004"
  resource_group_name = var.admin_rg_name
}

ephemeral "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

resource "azurerm_resource_group" "resource-group" {
  name     = "rg-security-test-terraform"
  location = data.azurerm_location.current.location
}

resource "azurerm_mssql_server" "mssql-server" {
  name                                    = var.sql_server_name
  resource_group_name                     = azurerm_resource_group.resource-group.name
  location                                = azurerm_resource_group.resource-group.location
  version                                 = "12.0"
  administrator_login                     = var.sql_admin_login
  administrator_login_password_wo         = ephemeral.azurerm_key_vault_secret.sql_admin_password.value
  administrator_login_password_wo_version = 1
}

resource "azurerm_mssql_database" "mssql-database" {
  collation                                                  = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                                                = "Default"
  geo_backup_enabled                                         = false
  ledger_enabled                                             = false
  max_size_gb                                                = 2
  name                                                       = "test-db"
  server_id                                                  = azurerm_mssql_server.mssql-server.id
  sku_name                                                   = "Basic"
  storage_account_type                                       = "Local"
  tags                                                       = {}
  
}

#import {
#  id = ""
#  to = azurerm_mssql_database.mssql-database
#}