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

variable "os_type" {
    default = "Linux"
  
}

variable "sku_name" {
    default = "Y1"
  
}

variable "appname" {
    default = "functionapptest"
}

variable "planapp" {
    default = "appfunctionplan11"
  
}