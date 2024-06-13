variable "project" {
  description = "The project name used for all resources in this example"
  default     = "juiceshop"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default     = "westus2"
}

variable "environment" {
  description = "Which environment does this live in"
  default     = "dev"
}

variable "subscription_id" {
  type    = string
  default = "4bdab961-24c7-4b64-8cf0-2e9ee397f664"
}
