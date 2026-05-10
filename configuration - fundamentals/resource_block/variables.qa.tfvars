environment = "QA"
tags = {
  "environment" = "QA"
  "purpose"     = "demo"
}
number_of_instances = 2
enable_ha = false
vms_names = [ "vm_1", "vm_2" ]
net_configuration = [
  {
    "name" = "value1"
  },
  {
    "name" = "value2"
  }
]
set_subnets = [ "subnet_1", "subnet_2" ]

## Set environment variables
## export TF_VAR_environment = "QA"

## command line flags
## terraform plan -var="environment=QA"

## Variable precendence order:
## 1. Command line flags (-var)
## 2. **.auto.tfvars
## 3. **.tfvars
## 4. Environment variables (TF_VAR_)
## 5. Default values in variables.tf