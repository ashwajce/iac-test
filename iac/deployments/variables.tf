variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the Key Vault will be deployed."
  type        = string
}

variable "key_vault_name" {
  description = "The globally unique name of the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault and Resource Group will be deployed."
  type        = string
}

variable "sku_name" {
  description = "The SKU of the Key Vault. Possible values are 'standard' or 'premium'."
  type        = string
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The SKU name must be 'standard' or 'premium'."
  }
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for when soft_delete is enabled. This value can be between 7 and 90 days."
  type        = number
  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "Soft Delete Retention Days must be between 7 and 90."
  }
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault?"
  type        = bool
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, test, prod)."
  type        = string
}