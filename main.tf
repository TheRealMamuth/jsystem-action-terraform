module "vpc" {
  source = "./modules/vpc"
  name   = "example-vpc"
  region = "fra1"
}

module "project" {
  source       = "./modules/project"
  name         = "example-project"
  description  = "Project for Terraform DigitalOcean setup"
  purpose      = "Web development"
  environment  = "Development"
}

module "ssh_key" {
  source = "./modules/ssh_key"
  name   = "example-ssh-key"
}

module "droplet_ubuntu_22" {
  source    = "./modules/droplet"
  name      = "droplet-ubuntu-22"
  region    = "fra1"
  size      = "s-1vcpu-1gb"
  image     = "ubuntu-22-04-x64"
  ssh_keys  = [module.ssh_key.id]
  vpc_uuid  = module.vpc.id
  user_data = <<-EOT
    #cloud-config
    packages:
      - nginx
    runcmd:
      - echo '<h1>Welcome to Ubuntu 22.04</h1>' > /var/www/html/index.html
      - systemctl restart nginx
  EOT
}

module "droplet_ubuntu_20" {
  source    = "./modules/droplet"
  name      = "droplet-ubuntu-20"
  region    = "fra1"
  size      = "s-1vcpu-1gb"
  image     = "ubuntu-20-04-x64"
  ssh_keys  = [module.ssh_key.id]
  vpc_uuid  = module.vpc.id
  user_data = <<-EOT
    #cloud-config
    packages:
      - nginx
    runcmd:
      - echo '<h1>Welcome to Ubuntu 20.04</h1>' > /var/www/html/index.html
      - systemctl restart nginx
  EOT
}

module "firewall" {
  source = "./modules/firewall"
  name   = "example-firewall"

  inbound_rules = [
    { protocol = "tcp", port = "22", source = var.my_ip },
    { protocol = "tcp", port = "80", source = "0.0.0.0/0" },
    { protocol = "tcp", port = "443", source = "0.0.0.0/0" }
  ]

  outbound_rules = [
    { protocol = "tcp" },
    { protocol = "udp" },
    { protocol = "icmp" }
  ]

  droplet_ids = [
    module.droplet_ubuntu_22.id,
    module.droplet_ubuntu_20.id
  ]
}