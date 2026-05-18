## Moved block

Purpose: rename or relocate resources in state
When to use: Refactoring code structure, renaming resources

```tf
moved {
  from = azurerm_subnet.subnet1
	to = azurerm_subnet.prod_private
}
```

don't forget to remove the moved blocks from your code if they are no longer needed

## Removed block

purpose: stop managing a resource but keep it running
when to use: Handing off ownership, removing from terraform control

```tf
removed {
	from = aws_instance.production_db

	lifecycle {
		destroy = true
	}
}
```

## Import block

purpose: adopt existing infrastructure into terraform
when to use: bringing manually-created resources under management

```
import {
	to = aws_s3_bucket.terraform_state
	id = "terraform_state_bucket"
}
```
