resource "digitalocean_firewall" "this" {
  name = "mstepien-firewall"

  droplet_ids = var.droplet_ids

  dynamic "inbound_rule" {
    for_each = local.firewall

    content {
      protocol         = inbound_rule.value.protocol
      port_range       = inbound_rule.value.port_range
      source_addresses = inbound_rule.value.source_addresses
    }
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}