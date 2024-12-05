variable "ssh_key_name" {
  description = "DigitalOcean SSH key name"
  type        = string
  default     = concat("digitalocean-ssh-key-", uuid())
}

variable "tls_rsa_key_length" {
  description = "TLS key length"
  type        = number
  default     = 4096
}