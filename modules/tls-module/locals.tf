locals {
  ssh_key_name = "${var.ssh_key_name}-${random_id.this}"
}