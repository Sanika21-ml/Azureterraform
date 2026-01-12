module "resourcegroup" {
    source = "../Module/resourcegroup"
    rg = var.rg
    location = var.location
  
}

module "Storage-account" {
    source = "../Module/Storage-account"
    rg = var.rg
    location = var.location
    storage = var.storage

    depends_on = [ module.resourcegroup ]
  
}

module "vnet" {
    source = "../Module/vnet"
    rg = var.rg
    location = var.location
    vnetname = var.vnetname
    address_space = var.address_space
    subnetname = var.subnetname
    address_prefixes = var.address_prefixes

    depends_on = [ module.resourcegroup ]
  
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

module "appservice" {
    source = "../Module/appservice"
    rg = var.rg
    location = var.location
    plan = var.plan 

    depends_on = [ module.resourcegroup ]
  
}

