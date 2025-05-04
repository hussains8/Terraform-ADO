variable "name" {
  description = "Name of the ACR instance"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "admin_enabled" {
  type    = bool
  default = true
}

variable "aks_principal_id" {
  description = "The AKS cluster managed identity principal ID"
  type        = string
}
