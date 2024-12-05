variable "vpc_name" {
  type        = string
  description = "Name of VPC"
  default     = "vpc"
}

variable "vpc_region" {
  type        = string
  description = "Name of region"
  default     = "fra1"
}

variable "vpc_description" {
  type        = string
  description = "Human readable vpc description"
  default     = "VPC for region ${var.vpc_region}"
}

variable "vpc_ip_range" {
  type        = string
  description = "IP range of VPC"
  default     = "10.11.114.0/24"
}