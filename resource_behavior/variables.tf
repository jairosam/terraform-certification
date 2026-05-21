variable "variable_test" {
  type = string


  validation {
    condition     = contains(["value1", "value2", "value3"], var.variable_test)
    error_message = "error in variable validation"
  }

}

variable "count" {
  type = number
  validation {
    condition     = var.count >= 1 && var.count <= 10
    error_message = "CPU Count is not within the allow range"
  }
}