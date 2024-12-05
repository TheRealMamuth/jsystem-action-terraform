variable "ssh-key-name" {
  description = "DigitalOcean SSH key name"
  type        = string
  default     = concat("digitalocean-ssh-key-", uuid())
}