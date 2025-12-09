# terraform.tfvars
resource_group_name = "example-rg-keyvault-prod"
location            = "EastUS"
key_vault_name      = "my-key-vault-test1" # Changed key vault name
tenant_id           = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" # Replace with your Azure Tenant ID

# Optional variables (uncomment and modify if you want to override defaults)
# sku_name                     = "premium"
# enabled_for_disk_encryption  = true
# purge_protection_enabled     = true
# allowed_ip_addresses         = ["203.0.113.45/32", "192.0.2.0/24"]
# tags = {
#   Environment = "Production"
#   Project     = "KeyVaultDemo"
# }
