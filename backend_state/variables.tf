variable "vnet_address_space" {
  description = "Address space for virtual networks"
  type        = list(string)
  default     = ["192.90.0.0/22"]
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "learning-terraform"
}

variable "subnet_app_cidr" {
  description = "subnet app cidr"
  type        = string
  default     = "192.90.1.0/24"

}

variable "subnet_web_cidr" {
  description = "subnet web cidr"
  type        = string
  default     = "192.90.2.0/24"
}