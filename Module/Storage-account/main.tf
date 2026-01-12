resource "azurerm_storage_account" "storage" {
    name = var.storage
    resource_group_name = var.rg
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"
  
}