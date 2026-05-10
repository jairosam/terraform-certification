variable "subscription_id_1" {
  type = string
}

variable "subscription_id_2" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "rg_sub_2" {
  type = map(string)
  default = {
    "vm_rg"   = "virtual_machines_rg_2"
    "vnet_rg" = "vnet_rg_2"
  }
}

variable "rg_sub_1" {
  type = map(string)
  default = {
    "vm_rg"   = "virtual_machines_rg_1"
    "vnet_rg" = "vnet_rg_1"
  }
}