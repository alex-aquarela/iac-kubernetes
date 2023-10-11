variable "resource_group_location" {
  default = "eastus2"
}

// Variáveis para autenticação

variable "subscription_id" {
  type    = string
}

variable "tenant_id" {
  type    = string
}

variable "client_id" {
  type    = string
}

variable "client_secret" {
  type    = string
}

// Variáveis para configuração do cluster AKS

variable "default_node_pool_name" {
  type    = string
  default = "agentpool"
}

variable "node_count"  {
  type    = number   
  default = 1
}

variable "vm_size" {
  type    = string
  default = "Standard_B2ms"
}

variable "aks_identity" {
  type    = string
  default = "SystemAssigned"
}

variable "network_plugin" {
  type    = string
  default = "kubenet"
}

variable "load_balancer_sku" {
  type    = string
  default = "standard"
}