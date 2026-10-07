variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the network resources."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet for AVD session hosts."
  default     = "snet-avd"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "tags" {
  type        = map(string)
  description = "Tags for network resources."
  default     = {}
}
