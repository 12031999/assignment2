resource "null_resource" "display_hostnames" {
 count               = var.vm_count
 depends_on          = [azurerm_virtual_machine.vm]
  provisioner "remote-exec" {
    inline = [
    "hostname"
    ]
    connection {
  host        = azurerm_public_ip.pip[count.index+1].ip_address
  type        = "ssh"
  user        = var.admin_username
  private_key = file(var.ssh_private_key)
}
}

 provisioner "local-exec" {
    command = "ssh-keyscan ${azurerm_public_ip.pip[count.index+1].ip_address} >> ~/.ssh/known_hosts"
  }

 provisioner "local-exec" {
    command = "ansible-playbook -i '${azurerm_public_ip.pip[count.index+1].ip_address},' -u ${var.admin_username} --private-key=${var.ssh_private_key} ansible/groupX-playbook.yaml"
     
}
}
