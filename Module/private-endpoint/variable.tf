variable "rg" {
    description = "resource group name"
    default = "RG-Gitdemo"
  
}

variable "location" {
     description = "location of resource group"
     default = "centralindia"
}

variable "storage" {
    description = "storage account name"
    default = "backendstatefilegit"
  
}

variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Replication type"
  type        = string
  default     = "LRS"
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

variable "vmname" {
    description = "virtual machine name"
    default = "machine1"
  
}

variable "admin_username" {
    description = "username"
    default = "azureuser"
  
}

variable "admin_password" {
    description = "password for vm"
    default = "password@1234"
  
}

variable "vm_size" {
    description = "size of vm"
    default = "Standard_B2ats_v2"
  
}


variable "private" {
    description = "name of private endpoints"
    default = "storage-endpoint-demo"
}

variable "connect" {
    default = "first-private-connection1"
    description = "private connection name"
}

variable "dnsname" {
    default = "demo-dns"
  
}

variable "vnetlink" {
    default = "dnslink"
  
}