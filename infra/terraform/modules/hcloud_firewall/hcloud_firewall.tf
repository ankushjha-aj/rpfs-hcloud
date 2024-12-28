# Create a firewall in Hetzner Cloud
resource "hcloud_firewall" "firewall" {
  name = "${var.org_name}-${var.app_name}-${terraform.workspace}-firewall"

  # Add dynamic rules to the firewall
  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      direction       = rule.value.direction
      protocol        = rule.value.protocol
      port            = rule.value.port
      source_ips      = rule.value.source_ips
      destination_ips = rule.value.destination_ips
      description     = rule.value.description
    }
  }
}
