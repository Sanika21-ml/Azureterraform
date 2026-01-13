output "storage_id" {
    value = azurerm_storage_account.storage.id
  
}

output "primary_key" {
    value = azurerm_storage_account.storage.primary_access_key
  
}