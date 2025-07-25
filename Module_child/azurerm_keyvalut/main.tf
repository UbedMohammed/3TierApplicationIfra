data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "key_vaults" {
  for_each                    = var.key_vaults
  name                        = each.value.key_vaultsname
  location                    = each.value.location
  resource_group_name         = each.value.rgname
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List",
      "Recover",
      "Purge",
      "Backup",
      "Restore",

    ]

    storage_permissions = [
      "Get",
    ]
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_key_vault_secret" "user_secret" {
  for_each     = var.key_vaults
  name         = each.value.user_secretname
  value        = each.value.vm1username
  key_vault_id = azurerm_key_vault.key_vaults[each.key].id
}

resource "azurerm_key_vault_secret" "password_secret" {
  for_each     = var.key_vaults
  name         = each.value.password_secret
  value        = each.value.vm1password
  key_vault_id = azurerm_key_vault.key_vaults[each.key].id
}
