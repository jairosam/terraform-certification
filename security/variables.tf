# variable set as an environment variable
variable "sql_admin_login" {
  description = "The login for the SQL Server administrator"
  type        = string
  sensitive   = true
}

variable "sql_server_name" {
  description = "SQL server name"
  type        = string
  default     = "test-default"
}

variable "admin_rg_name" {
  description = "resource group for secrets and tfstate file"
  type        = string
  default     = "terraform-administration"
}