output "subnet_id" {
  value = azurerm_subnet.snet.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
  
}