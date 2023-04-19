variable "resource_group_name" {
  type        = string
  description = "Resource group where the load balancer should be created"
}

variable "location" {
  type        = string
  description = "Azure region where the load balancer should be created"
}

variable "humber_id" {
  type        = string
  description = "Humber ID to be used for creating unique resource names"
}

variable "linux_vm_nic_ids" {
  type        = list(string)
  description = "List of NIC IDs of the Linux VMs to be added to the backend pool"
}

variable "public_ip_address_ids" {
  type        = list(string)
  description = "Public IP address IDs to be used for the load balancer"
}

