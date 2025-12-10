output "key_vault_id" {
  description = "The ID of the Azure Key Vault."
  value       = azurerm_key_vault.main.id
}

output "key_vault_uri" {
  description = "The URI of the Azure Key Vault."
  value       = azurerm_key_vault.main.vault_uri
}

output "resource_group_name" {
  description = "The name of the Resource Group where the Key Vault is created."
  value       = azurerm_resource_group.kv_rg.name
}
