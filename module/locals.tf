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