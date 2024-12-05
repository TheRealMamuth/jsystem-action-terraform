output "vm_ids" {
  value = [ for vm in digitalocean_droplet.vm : vm.urn ]
}
output "vm_ipv4_address" {
  value = [ for vm in digitalocean_droplet.vm : vm.ipv4_address ]
}
