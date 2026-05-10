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