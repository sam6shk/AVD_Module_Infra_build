output "object_id" {
  value       = azuread_user.test_user.object_id
  description = "The Object ID of the created Entra ID user."
}

output "user_principal_name" {
  value       = azuread_user.test_user.user_principal_name
  description = "The UPN of the created Entra ID user."
}

output "password" {
  value       = azuread_user.test_user.password
  sensitive   = true
  description = "The password assigned to the Entra ID user."
}
