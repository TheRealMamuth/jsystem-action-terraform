output "id" {
  value = digitalocean_ssh_key.key.id
}
output "private_key" {
  value = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}