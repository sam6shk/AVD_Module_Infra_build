output "object_id" {
  value       = var.create_user ? azuread_user.test_user[0].object_id : data.azuread_user.existing_user[0].object_id
  description = "The Object ID of the Entra ID user."
}

output "user_principal_name" {
  value       = var.create_user ? azuread_user.test_user[0].user_principal_name : data.azuread_user.existing_user[0].user_principal_name
  description = "The UPN of the Entra ID user."
}

output "password" {
  value       = var.create_user ? (length(azuread_user.test_user) > 0 ? azuread_user.test_user[0].password : null) : null
  sensitive   = true
  description = "The password assigned to the Entra ID user (if created)."
}
