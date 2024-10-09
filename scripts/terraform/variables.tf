variable "app_name" {
  default = "arooma123"
}

variable "location" {
  default = "australiasoutheast"
}

variable "kubernetes_version" {
  default = "1.29.7"
}

variable "node_count" {
  default = 1
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
  sensitive = true
}

variable "tenant_id" {
  type = string
}
