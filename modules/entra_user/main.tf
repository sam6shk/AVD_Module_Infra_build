resource "random_password" "user_password" {
  count            = var.create_user && (var.password == null || var.password == "") ? 1 : 0
  length           = 16
  special          = true
  override_special = "!@#$%&*"
}

resource "azuread_user" "test_user" {
  count                 = var.create_user ? 1 : 0
  user_principal_name   = var.user_principal_name
  display_name          = var.display_name
  mail_nickname         = var.mail_nickname
  password              = var.password != null && var.password != "" ? var.password : random_password.user_password[0].result
  force_password_change = false
}

data "azuread_user" "existing_user" {
  count               = var.create_user ? 0 : 1
  user_principal_name = var.user_principal_name
}
