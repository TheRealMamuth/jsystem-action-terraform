variable "ssh_key_name" {
  description = "DigitalOcean SSH key name"
  type        = string
  default     = "digitalocean-ssh-key"
}

variable "tls_rsa_key_length" {
  description = "TLS key length"
  type        = number
  default     = 4096
}