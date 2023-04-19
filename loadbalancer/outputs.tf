output "loadbalancer_name" {
  value       = azurerm_lb.lb.name
  description = "The name of the created load balancer"
}
