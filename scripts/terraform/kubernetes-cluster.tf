resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "${var.app_name}-aks-cluster"
  location            = var.location
  resource_group_name = azurerm_resource_group.arooma123.name  
  dns_prefix          = "${var.app_name}-dns"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.container_eight.id
  skip_service_principal_aad_check = true
}
