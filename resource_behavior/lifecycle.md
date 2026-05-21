## prevent_destroy

when I don't want to delete teh resource when running terraform destroy

```
  lifecycle {
    prevent_destroy = [vm_size]
  }
```

## create_before_destroy

Terraform bt default will destroy the resource before recreating it.

Use it when you want terraform to create the new resource before destroying the old one.

```
  lifecycle {
    create_before_destroy = true
  }
```

## prevent_destroy

Prevents accidental deletion of critical resources. it includes terraform destroy command and changes requiring a replacement of the resource 

```
  lifecycle {
    prevent_destroy = true
  }
```

## ignore_changes

when the infrastructure is modified externally but i DONT want to revert back those changes 

```
  lifecycle {
    ignore_changes = [vm_size]
  }
```

## replace_triggered_by

Forces resource replacement when specified resources or attributes change. Useful for dependencies that don't trigger automatic replacement

```
  lifecycle {
    replace_triggered_by = [
      aws_security_group.web
    ]
  }
```

## Precondition - postcondition

Validate resource state before/after operations

```
  lifecycle {
    precondition = [
      condition     = var.vm_size != "Basic_A0"
      error_message = "Basic_A0 is deprecated"
    ]
  }
```

## Validation Mechanisms

Validation Process:
1. Variable validation
2. Preconditions
3. Postconditions
4. Checks

### 1. Variable validation

It validates:
* Input variables meet specific requirements
* input values fall within acceptable ranges
* prevent terraform operations if a variable is misconfigured
* failure results is displaying the configured error_message, and stops the operation from proceeding

### 4. Checks

It validates:
* Resources, data sources, variables, or outputs in your configuration
* Behavior of your infrastructure as a whole
* Infrastructure configuration without blocking operations
* the checkblock executes as the last step of plan or apply, after terraform has planned or provisioned your infrastructure

> It will NOT stop the deployment, it will let you know that the check has failed

```
check "web_health" {
  data "http" "web_health_endpoint" {
    url = "https://mysite.com/health"
  }

  assert {
    condition = data.http.web_health_endpoint.status_code == 200
    error_message = "Web Health returned an unsucessful response"
  }
}
```