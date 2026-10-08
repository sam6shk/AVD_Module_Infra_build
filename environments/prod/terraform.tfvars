environment    = "prod"
location       = "eastus"
domain_name    = "yourdomain.onmicrosoft.com"
admin_username = "avdadmin"
admin_password = "P@ssw0rd2026ProdSecure!"
vm_size        = "Standard_B2s"

tags = {
  Environment = "prod"
  Project     = "AVD-Infra"
  ManagedBy   = "Terraform"
}
