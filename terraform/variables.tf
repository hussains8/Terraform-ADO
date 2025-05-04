variable "aks_name" {
  type = string
}
variable "dns_prefix" {
  type = string
}
variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}
variable "node_count" {
  type    = number
  default = 2
}
variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets with name and address_prefix"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}