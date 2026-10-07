resource "random_password" "user_password" {
  count            = var.password == null || var.password == "" ? 1 : 0
  length           = 16
  special          = true
  override_special = "!@#$%&*"
}

resource "azuread_user" "test_user" {
  user_principal_name   = var.user_principal_name
  display_name          = var.display_name
  mail_nickname         = var.mail_nickname
  password              = var.password != null && var.password != "" ? var.password : random_password.user_password[0].result
  force_password_change = false
}
