resource "azurerm_public_ip" "loadbalancer_pip" {
  name                = "${var.humber_id}-lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  domain_name_label   = "myloadbalancer"
}

resource "azurerm_lb" "lb" {
  name                = "n9295-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = var.public_ip_address_ids[0] 
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "${var.humber_id}-backend-pool"
  loadbalancer_id     = azurerm_lb.lb.id
}


resource "azurerm_network_interface_backend_address_pool_association" "backend_pool_association" {
  count = length(var.linux_vm_nic_ids)

  network_interface_id    = var.linux_vm_nic_ids[count.index]
  ip_configuration_name   = "ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

