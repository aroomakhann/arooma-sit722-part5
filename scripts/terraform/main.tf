
resource "azurerm_resource_group" "flixtube" {
  name     = "${var.app_name}rg"
  location = var.location
}

resource "azurerm_container_registry" "container_eight" {
  name                = "${var.app_name}acr"
  resource_group_name = azurerm_resource_group.flixtube.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "${var.app_name}akscluster"
  location            = var.location
  resource_group_name = azurerm_resource_group.flixtube.name
  dns_prefix          = "${var.app_name}dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.container_eight.id
  skip_service_principal_aad_check = true
}

