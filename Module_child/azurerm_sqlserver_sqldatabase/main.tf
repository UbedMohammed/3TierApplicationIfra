resource "azurerm_mssql_server" "sqlserver1" {
    for_each = var.sqlserver1
  name                         = each.value.name
  resource_group_name          = each.value.rgname
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.password
  minimum_tls_version          = "1.2"

}

resource "azurerm_mssql_database" "sqldatabase1" {
  for_each = var.sqlserver1
  name         = each.value.dbname
  server_id    = azurerm_mssql_server.sqlserver1[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}

