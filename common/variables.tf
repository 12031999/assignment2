variable "resource_group_name" {
  type        = string
  description = "Resource group where the resources should be created"
}

variable "location" {
  type        = string
  description = "Azure region where the resources should be created"
}

variable "humber_id" {
  type        = string
  description = "Humber ID to be used for creating unique resource names"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resources"
}
