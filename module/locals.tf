
locals {
  vm = [
    {
      name   = "${var.name}-ubuntu-20"
      image  = "ubuntu-20-04-x64"
      region = var.region
      size   = "s-1vcpu-1gb"
    },
    {
      name   = "${var.name}-ubuntu-22"
      image  = "ubuntu-22-04-x64"
      region = var.region
      size   = "s-1vcpu-1gb"
    }
  ]
}

locals {
  firewall = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["192.168.1.110"]
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0"]
    }
  ]
}