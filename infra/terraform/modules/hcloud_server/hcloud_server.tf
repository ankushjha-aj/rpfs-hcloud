# Create an SSH key for server authentication
resource "hcloud_ssh_key" "ssh" {
  name       = "${var.org_name}-${var.app_name}-${terraform.workspace}-key"
  public_key = var.public_key_value
}

# Create servers in Hetzner Cloud using the provided configurations
resource "hcloud_server" "server" {
  for_each           = var.server_conf
  name               = "${var.org_name}-${var.app_name}-${terraform.workspace}-${each.key}"
  server_type        = each.value.server_type
  image              = each.value.image
  location           = each.value.location
  backups            = each.value.backups
  delete_protection  = each.value.delete_protection
  rebuild_protection = each.value.rebuild_protection
  ssh_keys           = [hcloud_ssh_key.ssh.id]
}

# Attach a firewall to the created servers
resource "hcloud_firewall_attachment" "server_firewall" {
  for_each    = var.server_conf
  firewall_id = var.firewall_id
  server_ids  = [hcloud_server.server[each.key].id]
}

resource "hcloud_volume_attachment" "volume_attachment" {
  for_each  = var.volume_attachments
  volume_id = var.volume_ids[each.value.volume_key]
  server_id = hcloud_server.server[each.value.server_key].id
  automount = each.value.automount
}