module "ssh_tls_module" {
  source = "./modules/tls-module"

  # optionals
  ssh_key_name = "value"
  tls_rsa_key_length = 4096
}
