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

