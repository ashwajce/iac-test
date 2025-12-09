resource_group_name = "rg-security-prod"
location            = "westeurope"
key_vault_name      = "test-kva"
tenant_id           = "f8cdef31-a31e-4b4a-93e4-5f571e91255a"
sku_name            = "standard"
allowed_ip_addresses = ["10.0.0.0/24"]
purge_protection_enabled = true
soft_delete_retention_days = 7

tags = {
  Environment = "Production"
  Project     = "Security"
}
