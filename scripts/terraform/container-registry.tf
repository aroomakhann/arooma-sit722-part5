resource "azurerm_container_registry" "container_eight" {
  name                = "${var.app_name}acr"
  resource_group_name = azurerm_resource_group.flixtube.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}