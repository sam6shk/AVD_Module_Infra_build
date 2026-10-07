variable "workspace_name" {
  type        = string
  description = "The name of the AVD workspace."
}

variable "location" {
  type        = string
  description = "The Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "application_group_ids" {
  type        = list(string)
  description = "List of application group IDs to associate with this workspace."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags for workspace."
  default     = {}
}
