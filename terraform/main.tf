module "resource_group" {
  source    = "./modules/resource_group"
  name      = var.resource_group_name
  location  = var.location
  tags      = var.tags
}

module "network" {
  source              = "./modules/network"
  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  subnets             = var.subnets
}
module "aks" {
  source              = "./modules/aks"
  name                = var.aks_name
  location            = var.location
  resource_group_name = module.resource_group.name
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size
  tags                = var.tags
}
module "acr" {
  source              = "./modules/acr"
  name                = var.acr_name             # ← from .tfvars
  resource_group_name = module.resource_group.name
  location            = var.location
  aks_principal_id    = module.aks.principal_id
}
