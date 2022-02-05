provider "azurerm" {
    features{}
}
resource "azurerm_resource_group" "demo" {
  name     = "demo-resources"
  location = "eastus"
}
resource "azurerm_mariadb_server" "database" {
  name                = "database-mariadb-server"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  administrator_login          = "mariadbadmin"
  administrator_login_password = "H@Sh1CoR3!"
  sku_name   =  "GP_Gen5_2"
  storage_mb = 5120
  version    = "10.2"
  auto_grow_enabled             = false
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = false
  ssl_enforcement_enabled       = false
}