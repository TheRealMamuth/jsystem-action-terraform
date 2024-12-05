
locals {
  project_name   = "${var.project_name}-${random_string.main.result}-test"
  droplet_name   = "${var.droplet_name}-${random_string.main.result}-test"
  network_name   = "${var.network_name}-${random_string.main.result}-test"
  firewall_name  = "${var.firewall_name}-${random_string.main.result}-test"
  ssh_key_name   = "${var.ssh_key_name}-${random_string.main.result}-test"
  environment    = "${var.environment}-${random_string.main.result}-test"
  firewall_rules = jsondecode(file("${path.root}/_files/config/firewall.json"))
}

# Random name generator
resource "random_string" "main" {
  length      = 6
  special     = false
  numeric     = true
  lower       = true
  min_lower   = 3
  min_numeric = 3
}

resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Project Digitalocean
resource "digitalocean_project" "main" {
  name        = local.project_name
  description = "A ${local.environment} project"
  purpose     = local.environment
  environment = var.environment
  resources   = [for vm in digitalocean_droplet.main : vm.urn]
}

resource "digitalocean_ssh_key" "main" {
  name       = local.ssh_key_name
  public_key = tls_private_key.main.public_key_openssh
}

# VPC
resource "digitalocean_vpc" "main" {
  name        = local.network_name
  region      = var.region
  ip_range    = var.ip_range
  description = "A ${local.environment} VPC"
}

resource "null_resource" "fix_vpc_delete" {
  provisioner "local-exec" {
    command = "sleep 10"
  }

  depends_on = [digitalocean_vpc.main]
}

# Digitalocean droplet
resource "digitalocean_droplet" "main" {
  for_each = jsondecode(file("${path.root}/_files/config/vms.json"))

  name              = "${local.droplet_name}-${each.value.name}"
  region            = each.value.region
  size              = each.value.size
  image             = each.value.image
  backups           = each.value.backups
  resize_disk       = each.value.resize_disk
  user_data         = file("${path.root}/_files/config/nginx.yml")
  droplet_agent     = each.value.droplet_agent
  graceful_shutdown = each.value.graceful_shutdown
  ipv6              = each.value.ipv6
  ssh_keys          = [digitalocean_ssh_key.main.id]
  monitoring        = each.value.monitoring
  vpc_uuid          = digitalocean_vpc.main.id
  tags              = each.value.tags

  provisioner "file" {
    source      = "${path.cwd}/_files/config/index.html"
    destination = "/tmp/index.html"

    connection {
      type        = "ssh"
      user        = "root"
      private_key = tls_private_key.main.private_key_openssh
      host        = self.ipv4_address
    }
  }

  depends_on = [null_resource.fix_vpc_delete]
}

# Digitalocean firewall

resource "digitalocean_firewall" "main" {
  name        = local.firewall_name
  droplet_ids = [for vm in digitalocean_droplet.main : vm.id]

  dynamic "inbound_rule" {
    for_each = local.firewall_rules.inbound_rules
    content {
      protocol         = inbound_rule.value.protocol
      port_range       = inbound_rule.value.ports
      source_addresses = inbound_rule.value.sources_addresses
    }
  }

  dynamic "outbound_rule" {
    for_each = local.firewall_rules.outbound_rules
    content {
      protocol              = outbound_rule.value.protocol
      port_range            = outbound_rule.value.ports
      destination_addresses = outbound_rule.value.destinations_addresses
    }
  }
}