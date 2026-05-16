locals {
	common_tags = {
		Environment = var.environment
		Project = var.project_name
		ManagedBy = "terraform"
		Region = var.location
		Subscription = data.azurerm_subscription.current.display_name
		TenantId = data.azurerm_client_config.current.tenant_id
	}

}