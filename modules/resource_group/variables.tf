variable "name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "resource group location"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resource group"
}