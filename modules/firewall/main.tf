resource "digitalocean_firewall" "firewall" {
  name = var.name

  dynamic "inbound_rule" {
    for_each = var.inbound_rules
    content {
      protocol         = inbound_rule.value.protocol
      ports            = inbound_rule.value.port
      source_addresses = [inbound_rule.value.source]
    }
  }

  dynamic "outbound_rule" {
    for_each = var.outbound_rules
    content {
      protocol              = outbound_rule.value.protocol
      destination_addresses = ["0.0.0.0/0"]
    }
  }

  droplet_ids = var.droplet_ids
}