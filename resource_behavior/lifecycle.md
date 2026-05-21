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