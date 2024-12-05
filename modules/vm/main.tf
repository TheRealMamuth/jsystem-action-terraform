resource "digitalocean_droplet" "cw2_vm_tz" {
  for_each = var.vms

  name       = "${var.prefix}-vm-${each.value.name}"
  image      = each.value.image
  region     = var.region
  size       = var.vm_size
  vpc_uuid   = var.vpc_uuid
  ssh_keys   = [var.ssk_key_id]
}