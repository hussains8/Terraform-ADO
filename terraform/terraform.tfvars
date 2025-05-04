resource_group_name = "aa-k8s-rg"
location            = "east us 2"

tags = {
  environment = "dev"
  project     = "k8s"
}

vnet_name          = "aa-k8s-vnet"
vnet_address_space = ["10.64.0.0/16"]

subnets = [
  {
    name           = "aa-k8s-app-sn"
    address_prefix = "10.64.64.0/18"
  }
]
aks_name       = "aa-dev-aks"
dns_prefix     = "aa-dev-aks"
node_count     = 1
vm_size        = "Standard_B2s"
acr_name = "devtestacr01"
