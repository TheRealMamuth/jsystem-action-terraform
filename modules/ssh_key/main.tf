resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "digitalocean_ssh_key" "key" {
  name       = var.name
  public_key = tls_private_key.ssh_key.public_key_openssh
}