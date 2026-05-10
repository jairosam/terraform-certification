variable "number_of_instances" {
  type = number
  default = 2
}

variable "enable_ha" {
  type = bool
  default = true
}

variable "vms_names" {
  type = list(string)
  default = ["vm1", "vm2"]
}

variable "net_configuration" {
  type = list(map(string))
  default = [ {
    "name" = "value"
  },
  {
    "name" = "value"
  }]
}

## Convert to a list to access the values
variable "set_subnets" {
  type = set(string)
  default = [ "subnet_1", "subnet_2" ]
}

variable "tags" {
  type = map(string)
  default = {
    "environment" = "test"
    "purpose"     = "demo"
  }
}

variable "environment" {
  type = string
  default = "test"
}