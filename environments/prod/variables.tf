variable "environment" {
  type        = string
  description = "Environment name (e.g. prod)."
  default     = "prod"
}

variable "location" {
  type        = string
  description = "Azure region for prod environment."
  default     = "eastus"
}

variable "create_test_user" {
  type        = bool
  description = "Set to true to create a new Entra ID test user, or false to use an existing Entra ID user UPN."
  default     = true
}

variable "domain_name" {
  type        = string
  description = "Primary Entra ID (Azure AD) verified domain name (e.g. sameershaik2outlook.onmicrosoft.com)."
  default     = "sameershaik2outlook.onmicrosoft.com"
}

variable "admin_username" {
  type        = string
  description = "Local administrator username for session host VMs."
  default     = "avdadmin"
}

variable "admin_password" {
  type        = string
  description = "Local administrator password for session host VMs."
  sensitive   = true
}

variable "vm_size" {
  type        = string
  description = "Virtual machine SKU size for session host VMs (e.g. Standard_B2s, Standard_D2s_v5)."
  default     = "Standard_B2s"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for prod environment."
  default = {
    Environment = "prod"
    Project     = "AVD-Infra"
    ManagedBy   = "Terraform"
  }
}
