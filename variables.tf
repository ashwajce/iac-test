variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the Key Vault will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be deployed."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault. Must be globally unique."
  type        = string
  default     = "iac-test1" # Modified: Added default value as requested
}

variable "tenant_id" {
  description = "The Azure Active Directory Tenant ID for the subscription."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Key Vault. Options: `standard` or `premium`."
  type        = string
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  description = "Should the Key Vault be enabled for Azure Disk Encryption?"
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Should the Key Vault be enabled for template deployment?"
  type        = bool
  default     = false
}

variable "enabled_for_volume_encryption" {
  description = "Should the Key Vault be enabled for volume encryption?"
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for soft-delete. Range: 7-90."
  type        = number
  default     = 90
}

variable "purge_protection_enabled" {
  description = "Should purge protection be enabled for this Key Vault?"
  type        = bool
  default     = false
}

variable "allowed_ip_addresses" {
  description = "A list of IP addresses or CIDR blocks to allow access to the Key Vault. Leave empty for public access."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
