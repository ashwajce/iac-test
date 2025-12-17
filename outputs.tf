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

output "storage_account_id" {
  description = "The ID of the Azure Storage Account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the Azure Storage Account."
  value       = azurerm_storage_account.main.primary_access_key
  sensitive   = true
}

output "new_storage_account_id" {
  description = "The ID of the new Azure Storage Account."
  value       = azurerm_storage_account.secondary.id
}

output "new_storage_account_primary_access_key" {
  description = "The primary access key for the new Azure Storage Account."
  value       = azurerm_storage_account.secondary.primary_access_key
  sensitive   = true
}

output "new_key_vault_id" {
  description = "The ID of the new Azure Key Vault."
  value       = azurerm_key_vault.secondary.id
}

output "new_key_vault_uri" {
  description = "The URI of the new Azure Key Vault."
  value       = azurerm_key_vault.secondary.vault_uri
}
