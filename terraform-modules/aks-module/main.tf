resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.prefix
  location            = var.resource_location
  resource_group_name = var.resource_group
  dns_prefix          = var.prefix

  default_node_pool {
    name           = var.default_node_pool_name
    node_count     = var.default_node_count
    vm_size        = var.default_vm_size
    vnet_subnet_id = var.vnet_subnet
  }

  identity {
    type = var.identity
  }
    addon_profile {
    http_application_routing {
      enabled = var.enable_ingress
    }
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.vm_size
  node_count            = var.node_pool_count
  vnet_subnet_id        = var.vnet_subnet
}