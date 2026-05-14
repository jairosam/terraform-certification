## Migrate
If you want to migrate the terraform state to a remote backend we should configure our backend and run `terraform init -migrate-state`

## Inspecting state
cli commands:

* `terraform state list` Important!!! -- List all resources -- only shows addresses
* `terraform show` Important!!! -- display state or plan details
  * terraform state show file.tfplan
  * terraform state show `<resource address>`

### Other subcommands
* `terraform state mv` -- move a resource
* `terraform state rm` -- remove a resource from state
* `terraform state pull` -- download state from current location
* `terraform state push` -- push state to the configured backend

## Terraform state drift
Terraform state doesn't match with the real world resources

two choices to fix state drift
1. run `terraform apply` and let terraform take the infrastructure back to the desired state
2. run `terraform apply -refresh-only` and terraform will pull the changes made manually and put them into the state file
    * We have to manually change our desired state to match the real world configuration and the state file

## Lose State
This happens when terraform losses access to the state file

we can chose between 3 options:
1. let terraform recreate all infrastructure
2. use import block un our desired state to pull back the infrastructure into our desired state
3. use `terraform import -id <resource-id> -resource <terraform-block>` command and the desired block is gonna manage that real world resource

## Refresh-Only Mode
When working with refresh-only mode

1. terraform plan -refresh-only
    * shows what would change in state
    * safe - makes no modifications
    * use this to investigate drift before committing
2. terraform plan -refresh-only
    * Actually updates the state file
    * makes the change permanent
