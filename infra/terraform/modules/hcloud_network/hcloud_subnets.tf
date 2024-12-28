# Resource to create subnets 
resource "hcloud_network_subnet" "subnet" {
  for_each     = var.subnet_conf
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = each.value.network_zone
  ip_range     = each.value.cidr_block
}