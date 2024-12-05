resource "digitalocean_droplet" "droplet" {
  name              = var.name
  region            = var.region
  size              = var.size
  image             = var.image
  ssh_keys          = var.ssh_keys
  vpc_uuid          = var.vpc_uuid

  user_data = var.user_data
}