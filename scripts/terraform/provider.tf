terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71.0"
    }
  }

  required_version = ">= 1.5.6"
}

resource "azurerm_resource_group" "flixtube" {
  name     = "${var.app_name}-rg"
  location = var.location
}


provider "azurerm" {
  features {}
  skip_provider_registration = true

  # Azure authentication details
  subscription_id = "fa22ab62-488d-41db-ae59-8676bb148c6d" 
  client_id       = "10746947-54d5-447d-857f-b9f87022c9ca" 
  client_secret   = "Nol8Q~me9uhSTuI-bYRR~Vm~U7vsQY.n2j4bocr~" 
  tenant_id       = "2625129d-99a2-4df5-988e-5c5d07e7d0fb"  
}
