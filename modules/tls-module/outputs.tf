output "open_ssh_key_id" {
  description = "Digital Ocean SSH key resource id"
  value       = digitalocean_ssh_key.open-ssh-key.id
  sensitive   = true
}