variable "resource_group_grafana" {
  default = "rg-grafana-adv001-prd"
}

// g
variable "grafana_dashboard" {
  default     = "am-adv001-prd"
  description = "value"
}

variable "resource_group_location" {
  default = "eastus2"
}

/** 
 *  Abaixo estão todas as variáveis de autenticação
 *  
 *  Variável de subscrição
 */
variable "subscription_id" {
  default = "3577c57f-b2cc-4e53-9eb5-690756ea2940"
}

/** 
 *  Variável de autenticação
 */
variable "tenant_id" {
  default = "c49113bf-6e0d-4ed7-b7c0-9d9272dfb531"
}

/** 
 *  Variável de autenticação de usuário 
 */
variable "client_id" {
  default = "0d8e69bc-8a2f-4ae7-8667-b9d8487d36a5"
}

/** 
 *  Variável de autenticação de usuário 
 */
variable "client_secret" {
  default = "63b8Q~.iXtREkP19dC3TK_dTtGqLaxN_Z4pmoaxc"
}