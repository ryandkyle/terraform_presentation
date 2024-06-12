// Subnet module variables

variable "resource_group_name" {
  description = "Name of the owning Resource Group"
  type        = string
}

variable "prefix" {
  description = "Prefix for the subnet, usually the project name"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the owning VNET"
  type        = string
}

variable "subnet_postfix" {
  description = "Name of the subnet. Must be unique within the vnet."
  type        = string
}
