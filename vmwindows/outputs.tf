output "vm_hostname" {
  value = join("", [for profile in azurerm_virtual_machine.vm.os_profile : profile.computer_name])
}


output "vm_domain_name" {
  value       = azurerm_public_ip.pip.domain_name_label
  description = "The domain name of the created Windows VM"
}

output "vm_private_ip" {
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
  description = "The private IP address of the created Windows VM"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "The public IP address of the created Windows VM"
}
