variable "app_group_name" {
  type        = string
  description = "The name of the AVD application group."
}

variable "location" {
  type        = string
  description = "The Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "app_group_type" {
  type        = string
  description = "Application group type: Desktop or RemoteApp."
  default     = "Desktop"
  validation {
    condition     = contains(["Desktop", "RemoteApp"], var.app_group_type)
    error_message = "app_group_type must be Desktop or RemoteApp."
  }
}

variable "host_pool_id" {
  type        = string
  description = "The ID of the associated host pool."
}

variable "assignee_principal_ids" {
  type        = list(string)
  description = "List of Entra ID principal Object IDs to assign 'Desktop Virtualization User' role."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags for the application group."
  default     = {}
}
