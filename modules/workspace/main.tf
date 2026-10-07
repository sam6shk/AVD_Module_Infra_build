resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "assoc" {
  for_each             = toset(var.application_group_ids)
  workspace_id         = azurerm_virtual_desktop_workspace.workspace.id
  application_group_id = each.value
}
