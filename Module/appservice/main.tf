resource "azurerm_service_plan" "asp" {
    name = var.plan
    resource_group_name = var.rg
    location = var.location
    os_type = var.os_type
    sku_name = var.sku_name
}

resource "azurerm_windows_web_app" "as" {
    name ="${var.plan}-web"
    resource_group_name = var.rg
    location = var.location
    service_plan_id = azurerm_service_plan.asp.id
    site_config {
         always_on = false
    }
  
}

