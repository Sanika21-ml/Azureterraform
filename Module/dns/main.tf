resource "azurerm_private_dns_a_record" "record" {
    name = var.vnetname
    zone_name = var.dns_zone
    resource_group_name = var.rg
    ttl = 300
    records = [ 
        var.nic

    ]
  
}