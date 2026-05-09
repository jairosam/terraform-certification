### common files
* main.tf
* variables.tf
* outputs.tf
* providers.tf
* terraform.tfvars

Common names generally adopted by terraform community

### Additional Files
by default the files created by terraform are gonna live in themain directory

* terraform.tfstate -> The file that terraform uses to store state
* terraform.tfstate.backup -> Backup of the previous state file before terraform writes anything in the state file
* .terraform.lock.hcl -> Used to track and select provider versions

### Working directory 
It's very common that we migth have to manage different projects, applications, environments, etc

```
- Terraform
|---- Prod
        |
        |
        |---- main.tf       |
        |---- variables.tf  | State
        |---- outputs.tf    |
|---- Dev
        |---- main.tf       |
        |---- variables.tf  | State
        |---- outputs.tf    |

```