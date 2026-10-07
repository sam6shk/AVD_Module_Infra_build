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
  description = "Common tags for prod environment."
  default = {
    Environment = "prod"
    Project     = "AVD-Infra"
    ManagedBy   = "Terraform"
  }
}
