resource "azurerm_postgresql_server" "postgresql_server" {
  name                = "${var.humber_id}-postgresql"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "B_Gen5_1"

  storage_mb = 5120
  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled = false

  administrator_login          = "postgres"
  administrator_login_password = "HumberID-Admin-Password123!"

  version = "9.6"
  ssl_enforcement_enabled = true
}
