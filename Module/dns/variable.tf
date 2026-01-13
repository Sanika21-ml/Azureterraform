variable "dns_zone" {
    type = string
  
}

variable "rg" {
    description = "resource group name"
    default = "RG-Gitdemo"
  
}

variable "location" {
     description = "location of resource group"
     default = "centralindia"
}

variable "vnetname" {
    description = "vnet name"
    default = "network-g"
  
}

variable "nic" {
    type = string
  
}