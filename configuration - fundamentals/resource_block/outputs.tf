output "virtual_network_id" {
  value = azurerm_virtual_network.virtual_network_1.id
  description = "Virtual network id"
}

output "nsg_sensitive" {
  value = azurerm_network_security_group.nsg_resource_block_1.name
  sensitive = true
}

## reference the output from another module
## output.virtual_network_id