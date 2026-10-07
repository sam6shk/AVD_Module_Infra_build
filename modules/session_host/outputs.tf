output "vm_id" {
  value       = azurerm_windows_virtual_machine.vm.id
  description = "The ID of the session host VM."
}

output "vm_name" {
  value       = azurerm_windows_virtual_machine.vm.name
  description = "The name of the session host VM."
}

output "private_ip" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "The private IP address of the session host VM."
}
