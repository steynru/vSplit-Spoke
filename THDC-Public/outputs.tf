output "Spoke-App-RG" {
  value = azurerm_resource_group.Spoke-App-RG.name
}

output "Spoke-Infra-VNET" {
  value = azurerm_virtual_network.Spoke-Infra-VNET
}

output "Infra-Subnet" {
  value = azurerm_subnet.Infra-Subnet
}

output "DB-Subnet" {
  value = azurerm_subnet.DB-Subnet
}

output "App-Subnet" {
  value = azurerm_subnet.App-Subnet
}

output "Web-Subnet" {
  value = azurerm_subnet.Web-Subnet
}

output "AKS01-Subnet" {
  value = azurerm_subnet.AKS01-Subnet
}