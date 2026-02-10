resource "azurerm_storage_account" "Test-SA" {
  name                     = "Test-SA"
  resource_group_name      = azurerm_resource_group.kv_rg.name
  location                 = azurerm_resource_group.kv_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"

  # Enforce HTTPS traffic only for security best practice
  enable_https_traffic_only = true

  # Optional: Enable blob soft delete
  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
}

output "Test-SA_storage_account_id" {
  description = "The ID of the Test-SA Azure Storage Account."
  value       = azurerm_storage_account.Test-SA.id
}

output "Test-SA_storage_account_primary_access_key" {
  description = "The primary access key for the Test-SA Azure Storage Account."
  value       = azurerm_storage_account.Test-SA.primary_access_key
  sensitive   = true
}
