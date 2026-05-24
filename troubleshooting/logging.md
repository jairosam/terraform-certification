## To enable detailed logs in terraform executions
set the following variables
`export TF_LOG=TRACE`

## The following are the logs in terraform
* TRACE -> detailed logs message about internal terraform operations - it shows every api call, every decision point, every internal operation.
* DEBUG -> detailed logs about terraform operations - it shows internal operations but it doesn't provide a detailed view.
* INFO -> general information messages
* WARN -> only warning messages
* ERROR -> only shows actual errors

## Separete core and provider logging

`export TF_LOG_CORE=TRACE`

* logging can be enabled separately for terraform core itself and providers
* Takes the same level arguments
* Provide logs to the terraform core team

`export TF_LOG_PROVIDER=TRACE`

* Enable logging only for providers
* enable troubleshooting for providers adding api calls make to the provider, auth issues, etc

## Saving logs to a file

To export log files to a file

`export TF_LOG_PATH=terraform.log` 
