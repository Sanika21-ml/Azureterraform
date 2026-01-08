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

resource "azurerm_storage_account" "storage" {
    name = "backendstatefilegit"
    resource_group_name = "Git-rg"
    location = "centralindia"
    account_tier = "Standard"
    account_replication_type = "RAGRS"
  
}
