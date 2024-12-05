module "project" {
  source = "./modules/project"
}

module "ssh_tls_module" {
  source = "./modules/tls-module"
}

module "vm" {
  source     = "./modules/vm"

  ssh_key_id = module.ssh_tls_module.open_ssh_key_id
  #TODO after adding VPC module
  vpc_uuid   = ""
}