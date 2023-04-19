module "rgroup" {
  source     = "./rgroup"
  humber_id  = "n9295"
  location   = "East US"
  tags = {
    Project        = "Automation Project – Assignment 2"
    Name           = "Ganesh.Thampi"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

module "network" {
  source             = "./network"
  humber_id          = "n9295"
  resource_group_name = module.rgroup.resource_group_name
  location           = "East US" 
  tags = {
    Project        = "Automation Project – Assignment 2"
    Name           = "Ganesh.Thampi"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

module "common" {
  source             = "./common"
  humber_id          = "n9295"
  resource_group_name = module.rgroup.resource_group_name
  location           = "East US"
  tags = {
    Project        = "Automation Project – Assignment 2"
    Name           = "Ganesh.Thampi"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

module "vmlinux" {
  source             = "./vmlinux"
  humber_id          = "n9295"
  resource_group_name = module.rgroup.resource_group_name
  location           = "East US"
  subnet_id          = module.network.subnet_id
  storage_account_primary_blob_endpoint = module.common.storage_account_primary_blob_endpoint
  ssh_key                        = "/home/ganesh/Downloads/id_rsa.pub"
  ssh_private_key                = "/home/ganesh/Downloads/id_rsa"
  admin_username                 = "Ganesh"
  tags = {
    Project        = "Automation Project – Assignment 2"
    Name           = "Ganesh.Thampi"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}


module "vmwindows" {
  source             = "./vmwindows"
  humber_id          = "n9295"
  resource_group_name = module.rgroup.resource_group_name
  location           = "East US" 
  subnet_id          = module.network.subnet_id
  storage_account_primary_blob_endpoint = module.common.storage_account_primary_blob_endpoint
  tags = {
    Project        = "Automation Project – Assignment 2"
    Name           = "Ganesh.Thampi"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

module "datadisk" {
  source             = "./datadisk"
  humber_id          = "n9295"
  resource_group_name = module.rgroup.resource_group_name
  location           = "East US" 
  vm_ids = module.vmlinux.vm_ids
  
}

module "loadbalancer" {
  source             = "./loadbalancer"
  humber_id          = "n9295"
  resource_group_name = module.rgroup.resource_group_name
  location           = "East US" 
  public_ip_address_ids = module.vmlinux.public_ip_address_ids
  linux_vm_nic_ids   = module.vmlinux.vm_nic_ids
  
}

module "database" {
  source             = "./database"
  humber_id          = "n9295"
  resource_group_name = module.rgroup.resource_group_name
  location           = "East US"
}





