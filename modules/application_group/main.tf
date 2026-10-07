resource "azurerm_virtual_desktop_application_group" "appgroup" {
  name                = var.app_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.app_group_type
  host_pool_id        = var.host_pool_id
  tags                = var.tags
}

resource "azurerm_role_assignment" "avd_user_assignment" {
  count                = length(var.assignee_principal_ids)
  scope                = azurerm_virtual_desktop_application_group.appgroup.id
  role_definition_name = "Desktop Virtualization User"
  principal_id         = var.assignee_principal_ids[count.index]
}
