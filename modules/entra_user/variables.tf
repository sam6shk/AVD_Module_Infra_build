variable "user_principal_name" {
  type        = string
  description = "The User Principal Name (UPN) of the Entra ID test user."
}

variable "display_name" {
  type        = string
  description = "The display name of the Entra ID test user."
  default     = "AVD Test User"
}

variable "mail_nickname" {
  type        = string
  description = "The mail nickname of the Entra ID test user."
  default     = "avdtestuser"
}

variable "password" {
  type        = string
  description = "Optional custom password for the user. If null, a random secure password will be generated."
  default     = null
  sensitive   = true
}
