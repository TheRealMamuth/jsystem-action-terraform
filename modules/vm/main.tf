resource "digitalocean_droplet" "vm" {
  for_each = var.vms

  name       = "${var.prefix}-vm-${each.value.name}"
  image      = each.value.image
  region     = var.region
  size       = var.vm_size
  vpc_uuid   = var.vpc_uuid
  ssh_keys   = [var.ssh_key_id]
}