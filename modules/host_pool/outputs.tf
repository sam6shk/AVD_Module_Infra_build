output "id" {
  value       = azurerm_virtual_desktop_host_pool.hp.id
  description = "The ID of the AVD host pool."
}

output "name" {
  value       = azurerm_virtual_desktop_host_pool.hp.name
  description = "The name of the AVD host pool."
}

output "registration_token" {
  value       = azurerm_virtual_desktop_host_pool_registration_info.registration.token
  sensitive   = true
  description = "The registration token for session host onboarding."
}
