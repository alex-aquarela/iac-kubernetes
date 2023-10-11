resource "azurerm_resource_group" "rg_aks_tf" {
  name     = "rg_aks_tf"
  location = var.resource_group_location
}

resource "azurerm_storage_account" "aks_tf_storage_account" {
  name                     = "aks_tf_storage_account"
  resource_group_name      = azurerm_resource_group.rg_aks_tf.name
  location                 = azurerm_resource_group.rg_aks_tf.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_kubernetes_cluster" "aks_tf" {
  name                = "aks_tf"
  location            = azurerm_resource_group.rg_aks_tf.location
  resource_group_name = azurerm_resource_group.rg_aks_tf.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
  }
  
  identity {
    type = var.aks_identity
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }
}
