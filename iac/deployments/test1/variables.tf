variable "environment" {
  description = "The environment (e.g., dev, test, prod)"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "key_vault_name" {
  description = "Globally unique name for the Azure Key Vault"
  type        = string
}

variable "key_vault_sku" {
  description = "SKU for the Key Vault (Standard or Premium)"
  type        = string
  validation {
    condition     = contains(["Standard", "Premium"], var.key_vault_sku)
    error_message = "Key Vault SKU must be 'Standard' or 'Premium'."
  }
}

variable "vnet_name" {
  description = "Name of the Virtual Network for the Private Endpoint"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network (e.g., [\"10.0.0.0/16\"])"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the Subnet for the Private Endpoint"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix for the Subnet (e.g., \"10.0.1.0/24\")"
  type        = string
}
