output "Hub-Infra-RG" {
  value = azurerm_resource_group.Hub-Infra-RG.name
}

output "Hub-Infra-VNET" {
  value = azurerm_virtual_network.Hub-Infra-VNET
}

output "subnet_1" {
  value = azurerm_subnet.subnet_1
}

output "law_id" {
    value = azurerm_log_analytics_workspace.law_1.workspace_id
}

output "Hub-Keyvault" {
    value = azurerm_key_vault.Hub-Keyvault
}