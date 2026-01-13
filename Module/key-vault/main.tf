data "azurerm_client_config" "connect" {
  
}

resource "azurerm_key_vault" "key" {
    name = var.keyname
    resource_group_name = var.rg
    location = var.location
    sku_name = "standard"
    tenant_id = data.azurerm_client_config.connect.tenant_id

    access_policy {
    tenant_id = data.azurerm_client_config.connect.tenant_id
    object_id = data.azurerm_client_config.connect.object_id

   }
}

