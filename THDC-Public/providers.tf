provider "azurerm" {

  subscription_id = var.azure_sub_id_vscode_local
  client_id       = var.client_access_secret_id
  client_secret   = var.client-access-secret-value
  tenant_id       = var.azure_directory_id

  features {}
}

provider "random" {
}