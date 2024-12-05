variable "digitalocean_api_token" {
  description = "The DigitalOcean API token"
  type = string
  sensitive = true
}

variable "project_name" {
  description = "The name of the project"
  type = string
}

variable "droplet_name" {
  description = "The name of the droplet"
  type = string
}

variable "network_name" {
  description = "The name of the network"
  type = string
}

variable "firewall_name" {
  description = "The name of the firewall"
  type = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key"
  type = string
}

variable "region" {
  description = "The region to deploy the resources"
  type = string
}

variable "environment" {
  description = "The environment to deploy the resources"
  type = string
  default = "Development"

  validation {
    condition     = contains(["Development", "Staging", "Production"], var.environment)
    error_message = "The environment variable must be one of the following: Development, Staging, Production."
  }
}

variable "ip_range" {
  description = "The IP range for the VPC"
  type = string
}

