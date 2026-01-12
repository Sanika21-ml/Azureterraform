terraform {
  backend "azurerm" {
    resource_group_name  = "Git-rg"
    storage_account_name = "backendstatefilegit"
    container_name = "tfstate" 
    key = "terraform.tfstate"
  }
}

