terraform {
  backend "azurerm" {
    storage_account_name = "tfstaten01469295sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstatefiles"
    resource_group_name  = "tfstate-n01469295-RG"
    subscription_id      = "b78693a6-7bd2-42ed-a92a-0f1821ccf585"

  }
}
