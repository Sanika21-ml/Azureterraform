terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Git-rg"
    storage_account_name = "backendstatefilegit"
    container_name       = "stategit" 
  }
}

provider "azurerm" {
      features {
        
      }
}