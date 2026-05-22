output "server_dns" {
  value     = azurerm_mssql_server.mssql-server.fully_qualified_domain_name
  sensitive = true
}