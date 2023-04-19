resource "azurerm_availability_set" "aset" {
  name                         = "${var.humber_id}-win-aset"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
  tags                         = var.tags
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.humber_id}-win-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.humber_id}-win-dns"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.humber_id}-win-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.humber_id}-win-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B1ms"
  availability_set_id   = azurerm_availability_set.aset.id

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.humber_id}-win-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.humber_id}-win-host"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd123!"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent        = true
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = var.storage_account_primary_blob_endpoint
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  name                  = "Antimalware"
  virtual_machine_id    = azurerm_virtual_machine.vm.id
  publisher             = "Microsoft.Azure.Security"
  type                  = "IaaSAntimalware"
  type_handler_version  = "1.7"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
{
  "AntimalwareEnabled": true
}
SETTINGS
}

