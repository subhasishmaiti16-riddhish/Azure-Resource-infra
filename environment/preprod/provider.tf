terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "state-file-rg"
    storage_account_name = "statefileaccountfork8s"
    container_name       = "statefilestorage"
    key                  = "preprod.statefilestorage"

  }
}
provider "azurerm" {
  features {}

}
