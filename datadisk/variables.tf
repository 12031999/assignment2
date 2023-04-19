variable "resource_group_name" {
  type        = string
  description = "Resource group where the data disks should be created"
}

variable "location" {
  type        = string
  description = "Azure region where the data disks should be created"
}

variable "humber_id" {
  type        = string
  description = "Humber ID to be used for creating unique resource names"
}

variable "vm_ids" {
  type        = list(string)
  description = "List of VM IDs to attach the data disks"
}
