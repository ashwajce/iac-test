# Parameters for PRD environment
resource_group_name        = "rg-myorg-dev-uks-kv" # Note: You specified 'prd' environment, but the resource group name contains 'dev'. Please adjust if needed.
key_vault_name             = "kv-myorg-dev-uks-app1"   # Note: You specified 'prd' environment, but the Key Vault name contains 'dev'. Please adjust if needed.
location                   = "westeurope"
sku_name                   = "standard"
soft_delete_retention_days = 7
purge_protection_enabled   = false
environment                = "prd"