// Variáveis de autenticação

variable "subscription_id" {
  type    = string
}

variable "tenant_id" {
  type    = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string 
}

// Variáveis do Cluster AKS

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })

  default = {
    name     = "alex-labs"
    location = "eastus"
  }
}

variable "storage_account" {
  type = object({
    name                     = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  })  

  default = {
    name                     = "alexlabsstorageacc"
    location                 = "brazilsouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

variable "default_node_pool" {
  type = object({
    name       = string
    node_count = number
    vm_size    = string
  })

  default = {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }
}

variable "identity" {
  type    = string
  default = "SystemAssigned"
}

variable "aks_identity" {
  type    = string
  default = "SystemAssigned"
}

variable "network_profile" {
  type = object({
    network_plugin    = string
    load_balancer_sku = string
  })
  
  default = {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }
}