output "open_ssh_key_id" {
  value     = digitalocean_ssh_key.open-ssh-key.id
  sensitive = true
}