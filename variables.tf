variable "new_key_vault_name" {
  description = "A globally unique name for the new Azure Key Vault."
  type        = string
}

variable "new_key_vault_sku_name" {
  description = "The pricing tier for the new Key Vault (Standard or Premium)."
  type        = string
  default     = "standard"
}

variable "new_access_object_id" {
  description = "The Azure AD Object ID (User, Group, or Service Principal) to grant initial access policies to the new key vault."
  type        = string
}
