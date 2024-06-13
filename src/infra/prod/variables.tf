variable "project" {
  description = "The project name used for all resources in this example"
  default     = "juiceshop"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
}

variable "environment" {
  description = "Which environment does this live in"
}

variable "subscription_id" {
  type    = string
}
