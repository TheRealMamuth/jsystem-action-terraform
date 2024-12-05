output "vm_ids" {
  value = digitalocean_droplet.*.ipv4_address
}
output "vm_id_ip" {
  value = digitalocean_droplet.*.ipv4_address
}
