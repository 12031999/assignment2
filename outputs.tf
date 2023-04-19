output "resource_group_name" {
  value       = module.rgroup.resource_group_name
  description = "Resource group created by the 'rgroup' module"
}

output "vnet_name" {
  value       = module.network.vnet_name
  description = "Virtual network created by the 'network' module"
}

output "subnet_name" {
  value       = module.network.subnet_name
  description = "Subnet created by the 'network' module"
}

output "log_analytics_workspace_name" {
  value       = module.common.log_analytics_workspace_name
  description = "Log analytics workspace created by the 'common' module"
}

output "recovery_services_vault_name" {
  value       = module.common.recovery_services_vault_name
  description = "Recovery services vault created by the 'common' module"
}

output "storage_account_name" {
  value       = module.common.storage_account_name
  description = "Storage account created by the 'common' module"
}

output "linux_vm_details" {
  value = {
    hostnames      = module.vmlinux.vm_hostnames
    domain_names   = module.vmlinux.vm_domain_names
    private_ips    = module.vmlinux.vm_private_ips
    public_ips     = module.vmlinux.vm_public_ips
  }
  description = "Details of the Linux VMs created by the 'vmlinux' module"
}

output "windows_vm_details" {
  value = {
    hostname       = module.vmwindows.vm_hostname
    domain_name    = module.vmwindows.vm_domain_name
    private_ip     = module.vmwindows.vm_private_ip
    public_ip      = module.vmwindows.vm_public_ip
  }
  sensitive = true
  description = "Details of the Windows VM created by the 'vmwindows' module"
}

output "loadbalancer_name" {
  value       = module.loadbalancer.loadbalancer_name
  description = "The name of the created load balancer"
}

output "postgresql_instance_name" {
  value       = module.database.postgresql_instance_name
  description = "The name of the created PostgreSQL instance"
}
