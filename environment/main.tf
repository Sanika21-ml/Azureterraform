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

module "virtualmachine" {
    source = "../Module/virtualmachine"
    rg = var.rg
    location = var.location
    vmname = var.vmname
    vm_size = var.vm_size
    admin_username = var.admin_username
    admin_password = var.admin_password
    subnet_id = module.vnet.subnet_id

    depends_on = [ module.vnet ]
  
}

