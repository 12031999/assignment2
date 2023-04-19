output "postgresql_instance_name" {
  value       = azurerm_postgresql_server.postgresql_server.name
  description = "The name of the created PostgreSQL instance"
}
