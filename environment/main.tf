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

module "functionapp" {
    source = "../Module/functionapp"
    appname = var.appname
    rg = var.rg
    location = var.location
    planapp = var.planapp
    primary_key = module.Storage-account.primary_key

    depends_on = [ module.Storage-account ]
  
}

module "private-endpoint" {
    source = "../Module/private-endpoint"
    rg = var.rg
    location = var.location
    admin_username = var.admin_username
    admin_password = var.admin_password
    vnet_id = module.vnet.vnet_id
    subnet_id = module.vnet.subnet_id
    storage_id = module.Storage-account.storage_id

    depends_on = [ module.virtualmachine , module.vnet , module.Storage-account ]
  
}

module "key-vault" {
    source = "../Module/key-vault"
    rg = var.rg
    location = var.location

}

module "dns" {
    source = "../Module/dns"
    rg = var.rg
    dns_zone = module.private-endpoint.dns_zone
    nic = module.virtualmachine.nic 
  
}

