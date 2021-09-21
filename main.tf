provider "azurerm" {
    skip_provider_registration = true
	features {
	}
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
  account_replication_type = "GRS"

  tags = {
    appid = var.appid
    environment = var.env
  }
}