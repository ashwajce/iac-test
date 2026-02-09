variable "new_key_vault_name" {
  description = "A globally unique name for the new Azure Key Vault."
  type        = string
}

variable "new_key_vault_sku_name" {
  description = "The pricing tier for the new Key Vault (Standard or Premium)."
  type        = string
  default     = "standard"
}

variable "new_key_vault_soft_delete_retention_days" {
  description = "The number of days that the new Key Vault will retain soft-deleted secrets, keys, and certificates."
  type        = number
  default     = 7
}
