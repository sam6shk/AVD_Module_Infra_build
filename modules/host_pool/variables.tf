variable "host_pool_name" {
  type        = string
  description = "The name of the AVD host pool."
}

variable "location" {
  type        = string
  description = "The Azure region for the host pool."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "host_pool_type" {
  type        = string
  description = "The type of host pool: Personal or Pooled."
  default     = "Pooled"
  validation {
    condition     = contains(["Personal", "Pooled"], var.host_pool_type)
    error_message = "host_pool_type must be either Personal or Pooled."
  }
}

variable "load_balancer_type" {
  type        = string
  description = "The load balancer type: BreadthFirst, DepthFirst, or Persistent."
  default     = "BreadthFirst"
}

variable "personal_desktop_assignment_type" {
  type        = string
  description = "Assignment type for Personal host pool: Automatic or Direct."
  default     = "Automatic"
}

variable "maximum_sessions_allowed" {
  type        = number
  description = "Maximum sessions allowed per host for Pooled host pool."
  default     = 10
}

variable "validate_environment" {
  type        = bool
  description = "Validation environment flag for host pool."
  default     = false
}

variable "start_vm_on_connect" {
  type        = bool
  description = "Automatically start VM when user connects."
  default     = true
}

variable "custom_rdp_properties" {
  type        = string
  description = "Custom RDP properties string."
  default     = "audiocapturemode:i:1;videocapturemode:i:1;targetisaadjoined:i:1;enablerdsaadauth:i:1;drivestoredirect:s:*;redirectclipboard:i:1;"
}

variable "registration_expiration_date" {
  type        = string
  description = "Optional expiration date/time for host pool registration token (RFC3339 format). Defaults to dynamic 27-day offset if null."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags for host pool."
  default     = {}
}
