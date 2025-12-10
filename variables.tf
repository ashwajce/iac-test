variable "key_vault_name" {
  description = "A globally unique name for the Azure Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the Key Vault will be created."
  type        = string
}

variable "region" {
  description = "The Azure region for the Key Vault."
  type        = string
  default     = "westeurope"
}

variable "sku_name" {
  description = "The pricing tier for the Key Vault (Standard or Premium)."
  type        = string
  default     = "standard"
}

variable "initial_access_object_id" {
  description = "The Azure AD Object ID (User, Group, or Service Principal) to grant initial access policies."
  type        = string
}
