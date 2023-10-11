resource "azurerm_resource_group" "rg_grafana" {
  name     = var.resource_group_grafana
  location = var.resource_group_location
}

resource "azurerm_storage_account" "asatf_storage_account" {
  name                     = "stactfadv001prd"
  resource_group_name      = azurerm_resource_group.rg_grafana.name
  location                 = azurerm_resource_group.rg_grafana.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_kubernetes_cluster" "aml_aks" {
  name                = "aks-adv001-prd"
  location            = azurerm_resource_group.rg_grafana.location
  resource_group_name = azurerm_resource_group.rg_grafana.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "ndadv001prd"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }
  
  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}
