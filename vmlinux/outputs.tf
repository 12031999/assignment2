output "vm_hostnames" {
 value = [for i in range(var.vm_count) : azurerm_virtual_machine.vm[i].name]
}


output "vm_domain_names" {
  value = [for pip in azurerm_public_ip.pip : pip.domain_name_label]
  description = "The domain names of the created VMs"
}

output "vm_private_ips" {
  value = [for nic in azurerm_network_interface.nic : nic.ip_configuration[0].private_ip_address]
  description = "The private IP addresses of the created VMs"
}

output "vm_public_ips" {
  value = [for pip in azurerm_public_ip.pip : pip.ip_address]
  description = "The public IP addresses of the created VMs"
}

output "vm_ids" {
  value = [for vm in azurerm_virtual_machine.vm : vm.id]
}

output "vm_nic_ids" {
  value = [for nic in azurerm_network_interface.nic : nic.id ]
 
}


output "public_ip_address_ids" {
  value       = azurerm_public_ip.pip[*].id
  description = "The IDs of the public IP addresses created for the Linux VMs"
}





