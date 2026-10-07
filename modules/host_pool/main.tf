resource "azurerm_virtual_desktop_host_pool" "hp" {
  name                             = var.host_pool_name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  type                             = var.host_pool_type
  load_balancer_type               = var.load_balancer_type
  personal_desktop_assignment_type = var.host_pool_type == "Personal" ? var.personal_desktop_assignment_type : null
  maximum_sessions_allowed         = var.host_pool_type == "Pooled" ? var.maximum_sessions_allowed : null
  validate_environment             = var.validate_environment
  start_vm_on_connect              = var.start_vm_on_connect
  custom_rdp_properties            = var.custom_rdp_properties
  tags                             = var.tags
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "registration" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.hp.id
  expiration_date = var.registration_expiration_date
}
