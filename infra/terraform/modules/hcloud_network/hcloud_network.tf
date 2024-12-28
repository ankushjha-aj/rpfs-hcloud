# Resource to create Hetzner Network
resource "hcloud_network" "network" {
  name     = "${var.org_name}-${var.app_name}-${terraform.workspace}-network"
  ip_range = var.network_cidr_block
}
