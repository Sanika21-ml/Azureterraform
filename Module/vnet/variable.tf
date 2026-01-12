variable "rg" {
    description = "resource group name"
    default = "RG-Gitdemo"
  
}

variable "location" {
     description = "location of resource group"
     default = "centralindia"
}

variable "address_space" {
    description = "address space for vnet"
    default = ["10.0.0.0/16"]
  
}

variable "vnetname" {
    description = "vnet name"
    default = "network-g"
  
}

variable "subnetname" {
    description = "subnet name"
    default = "subnet-1"
  
}

variable "address_prefixes" {
    description = "address prefixes for subnet"
    default = ["10.0.1.0/24"]
  
}