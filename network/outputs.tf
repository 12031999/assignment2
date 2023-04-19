output "virtual_network_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the created virtual network"
}

output "subnet_name" {
  value       = azurerm_subnet.subnet.name
  description = "The name of the created subnet"
}

output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "The ID of the created subnet"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the created virtual network"
}
