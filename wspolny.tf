module "project" {
  source = "./modules/project"
  project_resources = module.vm.vm_ids
}

module "ssh_tls_module" {
  source = "./modules/tls-module"
}

module "network" {
  source = "./modules/network"
  vpc_description = "testnetwork"
}

module "vm" {
  source     = "./modules/vm"

  ssh_key_id = module.ssh_tls_module.open_ssh_key_id
  vpc_uuid   = module.network.vpc_id
}