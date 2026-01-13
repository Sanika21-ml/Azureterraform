

resource "azurerm_service_plan" "appplan" {
    name = var.planapp
    resource_group_name = var.rg
    location = var.location
    os_type = var.os_type
    sku_name = var.sku_name
}

resource "azurerm_linux_function_app" "function" {
    name = var.appname
    resource_group_name = var.rg
    location = var.location
    service_plan_id = azurerm_service_plan.appplan.id
    storage_account_name = var.storage
    storage_account_access_key = var.primary_key
    site_config {

    }
  
}