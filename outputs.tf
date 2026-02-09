output "new_key_vault_id" {
  description = "The ID of the new Azure Key Vault."
  value       = azurerm_key_vault.new_kv.id
}

output "new_key_vault_uri" {
  description = "The URI of the new Azure Key Vault."
  value       = azurerm_key_vault.new_kv.vault_uri
}
