resource "azurerm_service_plan" "asp" {
     resource_group_name = var.rg
    location = var.location
    name = var.plan
    os_type = var.os_type
    sku_name = var.sku_name
}

resource "azurerm_windows_web_app" "as" {
    resource_group_name = var.rg
    location = var.location
    name ="${var.plan}-web"
    service_plan_id = azurerm_service_plan.asp.id
    site_config {
         always_on = false
    }
  
}

