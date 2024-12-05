resource "digitalocean_droplet" "vm" {
  for_each = var.vms

  name     = "${each.key}-vm-${each.value.name}"
  image    = each.value.image
  region   = each.value.region
  size     = each.value.size
  vpc_uuid = var.vpc_uuid
  ssh_keys = [var.ssh_key_id]
}