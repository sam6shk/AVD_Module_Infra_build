variable "vm_name" {
  type        = string
  description = "Name of the Session Host Virtual Machine."
}

variable "location" {
  type        = string
  description = "Azure region for the Session Host VM."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the Session Host NIC will be attached."
}

variable "vm_size" {
  type        = string
  description = "Virtual machine SKU size."
  default     = "Standard_D2s_v5"
}

variable "admin_username" {
  type        = string
  description = "Local Administrator username for the VM."
  default     = "localadmin"
}

variable "admin_password" {
  type        = string
  description = "Local Administrator password for the VM."
  sensitive   = true
}

variable "host_pool_name" {
  type        = string
  description = "Target AVD Host Pool name for agent registration."
}

variable "host_pool_registration_token" {
  type        = string
  description = "Host pool registration token string."
  sensitive   = true
}

variable "assigned_user_object_ids" {
  type        = list(string)
  description = "List of Entra ID user object IDs to assign 'Virtual Machine User Login' role."
  default     = []
}

variable "image_sku" {
  type        = string
  description = "Windows 11 multi-session SKU (e.g. win11-23h2-avd)."
  default     = "win11-23h2-avd"
}

variable "tags" {
  type        = map(string)
  description = "Tags for session host resources."
  default     = {}
}
