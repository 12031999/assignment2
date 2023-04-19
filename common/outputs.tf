output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.workspace.name
  description = "The name of the created log analytics workspace"
}

output "recovery_services_vault_name" {
  value       = azurerm_recovery_services_vault.vault.name
  description = "The name of the created recovery services vault"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage_account.name
  description = "The name of the created storage account"
}

output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
  description = "The primary blob endpoint of the created storage account"
}

