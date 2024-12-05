resource "tls_private_key" "tls-rsa-4096-private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "digitalocean_ssh_key" "open-ssh-key" {
  name       = "SSH key for virtual machines"
  public_key = tls_private_key.tls-rsa-4096-private-key.public_key_openssh
}