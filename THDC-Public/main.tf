#variable "azure_sub_id_vscode_local" {
#  type = string
#  default = ""
#}

variable "client_access_secret_id" {
  type = string
  default = ""
}

variable "client-access-secret-value" {
  type = string
  default = ""
}

variable "azure_directory_id" {
  type = string
  default = ""
}

#variable "long_name" {
#  type = string
#  default = ""
#}

#variable "short_name" {
#  type = string
#  default = ""
#}

#variable "resource_location" {
#  type = string
#  default = ""
#}


########### Management 1  ###########
resource "azurerm_resource_group" "Spoke-Infra-RG" {
  name     = "${var.short_name}-INFRA-RG"
  location = var.resource_location
}

resource "azurerm_virtual_network" "Spoke-Infra-VNET" {
  name                = "${var.short_name}-VNET"
  location            = azurerm_resource_group.Spoke-Infra-RG.location
  resource_group_name = azurerm_resource_group.Spoke-Infra-RG.name
  address_space       = ["10.10.10.0/16"]
}

resource "azurerm_subnet" "subnet_1" {
  name                 = "${var.short_name}-SUBNET1"
  virtual_network_name = azurerm_virtual_network.Spoke-Infra-VNET.name
  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
  address_prefixes     = ["10.10.10.0/24"]
}

resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "HUbtoSpoke"
  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
  virtual_network_name      = azurerm_virtual_network.Spoke-Infra-VNET.name
  remote_virtual_network_id = data.tfe_outputs.Hub.outputs.Hub-Infra-VNET.name
}