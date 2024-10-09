resource "azurerm_container_registry" "container_eight" {
  name                = "${var.app_name}-acr"
  resource_group_name = azurerm_resource_group.arooma123.name  # Correctly reference the resource group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}
