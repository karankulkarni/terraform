terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.61.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "example" {
  name     = var.rg-name
  location = "Central India"
}

resource "azurerm_storage_account" "store" {
  name                     = "storageaccountname07224"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    appid = var.appid
    environment = var.env
  }
}
