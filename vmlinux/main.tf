resource "azurerm_availability_set" "aset" {
  name                         = "${var.humber_id}-aset"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
  tags                         = var.tags
}

resource "azurerm_public_ip" "pip" {
  count               = 3
  name                = "${var.humber_id}-pip-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = "${var.humber_id}-dns-${count.index}"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  count               = 2
  name                = "${var.humber_id}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip[count.index+1].id


  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "vm" {
  count                 = 2
  name                  = "${var.humber_id}-vm-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  vm_size               = "Standard_B1ms"
  availability_set_id   = azurerm_availability_set.aset.id

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.humber_id}-osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "N01469295-linux-${count.index+1}"
    admin_username = var.admin_username
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = file(var.ssh_key)
    }
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = var.storage_account_primary_blob_endpoint
  }

  delete_os_disk_on_termination = true
}




resource "azurerm_virtual_machine_extension" "network_watcher" {
  count                 = 2
  name                  = "NetworkWatcherAgentLinux"
  virtual_machine_id    = azurerm_virtual_machine.vm[count.index].id
  publisher             = "Microsoft.Azure.NetworkWatcher"
  type                  = "NetworkWatcherAgentLinux"
  type_handler_version  = "1.4"
  auto_upgrade_minor_version = true
}

