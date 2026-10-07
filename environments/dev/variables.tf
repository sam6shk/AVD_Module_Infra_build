variable "environment" {
  type        = string
  description = "Environment name (e.g. dev)."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region for dev environment."
  default     = "eastus"
}

variable "domain_name" {
  type        = string
  description = "Primary Entra ID (Azure AD) domain name for user principal name (e.g. contoso.onmicrosoft.com)."
  default     = "onmicrosoft.com"
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

variable "tags" {
  type        = map(string)
  description = "Common tags for dev environment."
  default = {
    Environment = "dev"
    Project     = "AVD-Infra"
    ManagedBy   = "Terraform"
  }
}
