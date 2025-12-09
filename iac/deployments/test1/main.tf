data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
  name                                          = var.subnet_name
  resource_group_name                           = azurerm_resource_group.rg.name
  virtual_network_name                          = azurerm_virtual_network.vnet.name
  address_prefixes                              = [var.subnet_address_prefix]
  private_endpoint_network_policies_enabled     = false # Required for Private Endpoints
  private_link_service_network_policies_enabled = true
}

resource "azurerm_key_vault" "akv" {
  name                            = var.key_vault_name
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  sku_name                        = var.key_vault_sku
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  enabled_for_rbac                = true # Recommended for new deployments
  public_network_access_enabled   = false # Enforce private-only access

  # Access policies are managed via RBAC when enabled_for_rbac is true
  # Therefore, 'access_policy' block is omitted.
}

resource "azurerm_private_endpoint" "pe" {
  name                = "${var.key_vault_name}-pe"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.key_vault_name}-psc"
    private_connection_resource_id = azurerm_key_vault.akv.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
}

resource "azurerm_private_dns_zone" "dns_zone_keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_vnet_link_keyvault" {
  name                  = "${azurerm_private_dns_zone.dns_zone_keyvault.name}-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone_keyvault.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_a_record" "keyvault_a_record" {
  name                = azurerm_key_vault.akv.name
  zone_name           = azurerm_private_dns_zone.dns_zone_keyvault.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  records             = [azurerm_private_endpoint.pe.private_service_connection[0].private_ip_address]
}
