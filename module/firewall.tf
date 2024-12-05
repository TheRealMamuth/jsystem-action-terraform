resource "digitalocean_firewall" "actions-firewall" {
  name = "mstepien-tactions-firewall"

  droplet_ids = [for vm in digitalocean_droplet.tactions-vm : vm.id]

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