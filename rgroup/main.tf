resource "azurerm_resource_group" "rg" {
  name     = "${var.humber_id}-assignment2-RG"
  location = var.location
  tags     = var.tags
}
