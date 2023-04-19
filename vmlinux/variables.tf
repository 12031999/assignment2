variable "resource_group_name" {
  type        = string
  description = "Resource group where the VMs should be created"
}

variable "location" {
  type        = string
  description = "Azure region where the VMs should be created"
}

variable "humber_id" {
  type        = string
  description = "Humber ID to be used for creating unique resource names"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the VMs"
}

variable "admin_username" {
  type        = string
}


variable "ssh_key" {
description = "The SSH public key to be added to the virtual machines."
type = string
}

variable "ssh_private_key" {
description = "The SSH private key to use to connect to the virtual machines."
type = string
}


variable "storage_account_primary_blob_endpoint" {
  type        = string
  description = "The primary blob endpoint of the storage account for boot diagnostics"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the VMs"
}


variable "vm_count" {
  type    = number
  default = 2
}