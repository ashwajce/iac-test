terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "kv_rg" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"
}

resource "azurerm_key_vault" "main" {
  name                = "${var.key_vault_name}"
  location            = azurerm_resource_group.kv_rg.location
  resource_group_name = azurerm_resource_group.kv_rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "${var.sku_name}"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.initial_access_object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Purge",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey"
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "Backup",
      "Restore"
    ]

    certificate_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "DeleteIssuers",
      "GetIssuers",
      "Import",
      "ManageIssuers",
      "SetIssuers",
      "Update",
      "Purge",
      "Recover",
      "Backup",
      "Restore"
    ]
  }

  # Optional: Enable soft delete and purge protection
  soft_delete_retention_days = 7
  purge_protection_enabled   = false # Set to true for higher security environments
}
