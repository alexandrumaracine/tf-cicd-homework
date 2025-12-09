terraform {
  backend "azurerm" {
    resource_group_name  = "testHomework"
    storage_account_name = "tfstatealexmara"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
