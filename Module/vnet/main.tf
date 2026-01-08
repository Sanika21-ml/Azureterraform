resource "azurerm_virtual_network" "vnet" {
    resource_group_name = var.rg
    name = var.vnetname
    location = var.location
    address_space = var.address_space  
}

resource "azurerm_subnet" "snet" {
    resource_group_name = var.rg
    virtual_network_name = azurerm_virtual_network.vnet.name
    name = var.subnetname
    address_prefixes = var.address_prefixes 
  
}