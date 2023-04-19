variable "humber_id" {
  type        = string
  description = "Humber ID to be used for creating unique resource group name"
}

variable "location" {
  type        = string
  description = "Azure region where the resource group should be created"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resource group"
}
