resource "tls_private_key" "tls-rsa-4096-private-key" {
  algorithm = "RSA"
  rsa_bits  = var.tls_rsa_key_length
}

resource "digitalocean_ssh_key" "open-ssh-key" {
  name       = var.ssh_key_name
  public_key = tls_private_key.tls-rsa-4096-private-key.public_key_openssh
}