output "Spoke-Infra-RG" {
  value = azurerm_resource_group.Spoke-Infra-RG.name
}

output "Spoke-Infra-VNET" {
  value = azurerm_virtual_network.Spoke-Infra-VNET
}

output "subnet_1" {
  value = azurerm_subnet.subnet_1
}
