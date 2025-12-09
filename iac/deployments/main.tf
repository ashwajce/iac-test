resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "main" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.sku_name

  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  dynamic "access_policy" {
    for_each = var.access_policies
    content {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = access_policy.value.object_id

      key_permissions         = access_policy.value.key_permissions
      secret_permissions      = access_policy.value.secret_permissions
      certificate_permissions = access_policy.value.certificate_permissions
    }
  }

  tags = {
    environment = "${var.environment}"
    purpose     = "Key Vault for ${var.key_vault_name}"
  }
}

data "azurerm_client_config" "current" {}

variable "key_vault_name" {
  description = "The globally unique name of the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be deployed."
  type        = string
}

variable "sku_name" {
  description = "The SKU of the Key Vault. Valid values are 'standard' or 'premium'."
  type        = string
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "SKU name must be 'standard' or 'premium'."
  }
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for soft-deleted Key Vaults. Defaults to 90. Valid values are between 7 and 90."
  type        = number
  default     = 90
  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "Soft delete retention days must be between 7 and 90."
  }
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault?"
  type        = bool
  default     = false
}

variable "access_policies" {
  description = "A list of objects describing access policies for the Key Vault."
  type = list(object({
    object_id             = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
  default = []
}

variable "environment" {
  description = "The environment tag for resources (e.g., 'dev', 'prod')."
  type        = string
  default     = "dev"
}
