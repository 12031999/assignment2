variable "resource_group_name" {
  type        = string
  description = "Resource group where the VM should be created"
}

variable "location" {
  type        = string
  description = "Azure region where the VM should be created"
}

variable "humber_id" {
  type        = string
  description = "Humber ID to be used for creating unique resource names"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the VM"
}

variable "storage_account_primary_blob_endpoint" {
  type        = string
  description = "The primary blob endpoint of the storage account for boot diagnostics"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the VM"
}
