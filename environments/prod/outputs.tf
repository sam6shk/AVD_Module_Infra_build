output "resource_group_name" {
  value       = module.resource_group.name
  description = "Name of the resource group."
}

output "vnet_id" {
  value       = module.network.vnet_id
  description = "Virtual Network ID."
}

output "subnet_id" {
  value       = module.network.subnet_id
  description = "AVD Subnet ID."
}

output "entra_test_user_upn" {
  value       = module.entra_test_user.user_principal_name
  description = "User Principal Name (UPN) of the Entra ID test user."
}

output "entra_test_user_password" {
  value       = module.entra_test_user.password
  sensitive   = true
  description = "Password of the Entra ID test user."
}

output "personal_host_pool_name" {
  value       = module.personal_host_pool.name
  description = "Name of the Personal AVD Host Pool."
}

output "personal_session_host_name" {
  value       = module.personal_session_host.vm_name
  description = "Name of the Personal Session Host VM."
}

output "pooled_host_pool_name" {
  value       = module.pooled_host_pool.name
  description = "Name of the Pooled AVD Host Pool."
}

output "pooled_session_host_name" {
  value       = module.pooled_session_host.vm_name
  description = "Name of the Pooled Session Host VM."
}

output "workspace_name" {
  value       = module.workspace.name
  description = "Name of the AVD Workspace."
}
