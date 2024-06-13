// Subnet module variables

variable "resource_group_name" {
  description = "Name of the owning Resource Group"
  type        = string
}

variable "workspace" {
  description = "workspace name, a combination of project name and environment"
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
