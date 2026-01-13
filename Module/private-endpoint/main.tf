
resource "azurerm_network_interface" "this" {
  name = "${var.vname}-nic"
  location = var.location
  resource_group_name = var.rg

  ip_configuration {
    name = "internal"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "this" {
  name = var.vname
  resource_group_name = var.rg
  location = var.location
  size = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


resource "azurerm_private_dns_zone" "dnsname" {
    name = "privatefile.blob.core.windows.net"
    resource_group_name = var.rg
}

resource "azurerm_private_endpoint" "private" {
    name = var.private
    subnet_id = var.subnet_id
    resource_group_name = var.rg
    location = var.location

    private_service_connection  {
      name = var.connect
      private_connection_resource_id = var.storage_id
      subresource_names = [ "blob" ]
      is_manual_connection = false
}
    private_dns_zone_group {
        name = var.dnsname
        private_dns_zone_ids = [ azurerm_private_dns_zone.dnsname.id ]
    }
  
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
    name = var.vnetlink 
    resource_group_name = var.rg
    private_dns_zone_name = azurerm_private_dns_zone.dnsname.name
    virtual_network_id = var.vnet_id
  
}