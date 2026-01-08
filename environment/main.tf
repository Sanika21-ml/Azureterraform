resource "azurerm_resource_group" "rg" {
    name = var.rg
    location = var.location  
}

module "vnet" {
    source = "../Module/vnet"
    rg = var.rg
    location = var.location
    vnetname = var.vnetname
    address_space = var.address_space
    subnetname = var.subnetname
    address_prefixes = var.address_prefixes

    depends_on = [ azurerm_resource_group.rg ]
  
}