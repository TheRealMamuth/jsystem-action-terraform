resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = var.tls_rsa_key_length
}

resource "digitalocean_ssh_key" "this" {
  name       = local.ssh_key_name
  public_key = tls_private_key.this.public_key_openssh
}