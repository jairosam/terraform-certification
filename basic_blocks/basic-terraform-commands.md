## structure

terraform <subcommand> [options or flags]

### Workflow steps in terraform
* write: Write your desired infrastructure in your terraform files
  * terraform validate
  * terraform fmt
* initialize: intialize our working directory
  * terraform init - intialize our providers and backend configurations if any.
* plan: validate the tfstate and desired state, after that it generates a plan to create, modify or destroy the infrastructure
  * terraform plan -out=plan.tfplan
* apply: Apply the changes in the actual infrastructure
  * terraform apply -auto-approve -input=false 
* destroy: Destroy all of our infrastructure or specific resources (if you run an apply after this command terraform will likely recreate the resources destroyed)
  * terraform destroy -target="resource_type.resource_name"

### Subcommands
* state: allows me to manage items in the state file
* show: display information about terraform manged infrastructure
* import: this command brings a resource into the terraform control

### Environment variables with the cli
* Provide a way to pass configuration settings to terraform without hardcoding them into our files
* Increase security by keeping sensitive data like API keys out of tf files

#### Common variables
* `export TF_LOG=DEBUG` enable detailed logs about terraform executions
* `export TF_VAR_svr_name="variable"` useful for passing in dynamic variables without hardcoding the value
* `export AWS_ACCESS_KEY_ID=1234` if terraform doesn't find specific variables in your configuration files it will look for them in our system variables, we can use this logic to pass in terraform different secret variables like spn secrets or providers auth tokens