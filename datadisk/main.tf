locals {
  disk_count = length(var.vm_ids)
}

resource "azurerm_managed_disk" "data_disk" {
  count                = local.disk_count
  name                 = "${var.humber_id}-data-disk-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count          = local.disk_count
  virtual_machine_id = var.vm_ids[count.index]
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  lun                = 1
  caching            = "None"
}
