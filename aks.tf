resource "azurerm_resource_group" "alex-labs" {
  name     = var.resource_group.name
  location = var.resource_group.location
}

resource "azurerm_storage_account" "alexlabsstorageaccount" {
  name                     = var.storage_account.name
  location                 = var.storage_account.location
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type
  resource_group_name      = var.resource_group.name
}

resource "azurerm_kubernetes_cluster" "aks_tf" {
  name                = "aks_tf"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = var.default_node_pool.name
    node_count = var.default_node_pool.node_count
    vm_size    = var.default_node_pool.vm_size
  }
  
  identity {
    type = var.identity
  }

  network_profile {
    network_plugin    = var.network_profile.network_plugin
    load_balancer_sku = var.network_profile.load_balancer_sku
  }
}
