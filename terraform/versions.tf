terraform {
  backend "azurerm" {
    resource_group_name  = "testHomework"
    storage_account_name = "tfstatealexmara"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    client_id       = var.client_id
    client_secret   = var.client_secret
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
