variable "plan" {
    description = "app service plan "
}

variable "rg" {
    description = "resource group name"
    default = "RG-Gitdemo"
  
}

variable "location" {
     description = "location of resource group"
     default = "centralindia"
}

variable "os_type" {
    default = "Windows"
  
}

variable "sku_name" {
    default = "D1"
  
}