output "open_ssh_key_id" {
  description = "Digital Ocean SSH key resource id"
  value       = digitalocean_ssh_key.this.id
  sensitive   = true
}