
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

########### Management 1  ###########
resource "azurerm_resource_group" "Spoke-Infra-RG" {
  name     = "${var.short_name}-INFRA-RG"
  location = var.resource_location
}

resource "azurerm_resource_group" "Spoke-App-RG" {
  name     = "${var.short_name}-APP-RG"
  location = var.resource_location
}

resource "azurerm_resource_group" "Spoke-AKS02-RG" {
  name     = "${var.short_name}-AKS-RG"
  location = var.resource_location
}

resource "azurerm_virtual_network" "Spoke-Infra-VNET" {
  name                = "${var.short_name}-Spoke-VNET"
  location            = azurerm_resource_group.Spoke-Infra-RG.location
  resource_group_name = azurerm_resource_group.Spoke-Infra-RG.name
  address_space       = var.vnet_ip_range
}

resource "azurerm_subnet" "Infra-Subnet" {
  name                 = "${var.short_name}-infra"
  virtual_network_name = azurerm_virtual_network.Spoke-Infra-VNET.name
  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
  address_prefixes     = var.infra-subnet
}

resource "azurerm_subnet" "DB-Subnet" {
  name                 = "${var.short_name}-db"
  virtual_network_name = azurerm_virtual_network.Spoke-Infra-VNET.name
  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
  address_prefixes     = var.db-subnet
}

resource "azurerm_subnet" "App-Subnet" {
  name                 = "${var.short_name}-app"
  virtual_network_name = azurerm_virtual_network.Spoke-Infra-VNET.name
  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
  address_prefixes     = var.app-subnet
}

resource "azurerm_subnet" "Web-Subnet" {
  name                 = "${var.short_name}-web"
  virtual_network_name = azurerm_virtual_network.Spoke-Infra-VNET.name
  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
  address_prefixes     = var.web-subnet
}

resource "azurerm_subnet" "AKS01-Subnet" {
  name                 = "${var.short_name}-aks01"
  virtual_network_name = azurerm_virtual_network.Spoke-Infra-VNET.name
  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
  address_prefixes     = var.aks01-subnet
}


#resource "azurerm_virtual_network_peering" "example-1" {
#  name                      = "SpokeToHub"
#  resource_group_name  = azurerm_resource_group.Spoke-Infra-RG.name
#  virtual_network_name      = azurerm_virtual_network.Spoke-Infra-VNET.name
#  remote_virtual_network_id = data.tfe_outputs.Hub.Hub-Infra-VNET.id
#  "/subscriptions/a008b1c5-30b6-4611-b9da-d01e0e529f51/resourceGroups/VSneuHub-INFRA-RG/providers/Microsoft.Network/virtualNetworks/VSneuHub-VNET"
#}