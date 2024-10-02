terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "acloudguru_training"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-6e04d116-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source               = "app.terraform.io/acloudguru_training/securestorage/azurerm"
  version              = "1.0.1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "UniqueSecureStorageName1022024"
}
