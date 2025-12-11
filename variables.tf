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

variable "storage_account_name" {
  description = "A globally unique name for the Azure Storage Account (must be 3-24 characters, lowercase letters and numbers only)."
  type        = string
}

variable "storage_account_tier" {
  description = "The pricing tier for the Storage Account (e.g., Standard, Premium)."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "The replication strategy for the Storage Account (e.g., LRS, GRS, ZRS)."
  type        = string
  default     = "GRS"
}

variable "storage_account_kind" {
  description = "The kind of Storage Account to create (e.g., StorageV2, BlobStorage)."
  type        = string
  default     = "StorageV2"
}

variable "new_storage_account_name" {
  description = "A globally unique name for the new Azure Storage Account (must be 3-24 characters, lowercase letters and numbers only)."
  type        = string
}

variable "new_storage_account_tier" {
  description = "The pricing tier for the new Storage Account (e.g., Standard, Premium)."
  type        = string
  default     = "Standard"
}

variable "new_storage_account_replication_type" {
  description = "The replication strategy for the new Storage Account (e.g., LRS, GRS, ZRS, RAGRS, GZRS, RAZRS)."
  type        = string
  default     = "GRS"
}

variable "new_storage_account_kind" {
  description = "The kind of Storage Account to create (e.g., StorageV2, BlobStorage, BlockBlobStorage, FileStorage)."
  type        = string
  default     = "StorageV2"
}

variable "new_key_vault_name" {
  description = "A globally unique name for the new Azure Key Vault."
  type        = string
}

variable "new_key_vault_sku_name" {
  description = "The pricing tier for the new Key Vault (Standard or Premium)."
  type        = string
  default     = "standard"
}

variable "new_key_vault_initial_access_object_id" {
  description = "The Azure AD Object ID (User, Group, or Service Principal) to grant initial access policies to the new Key Vault."
  type        = string
}
