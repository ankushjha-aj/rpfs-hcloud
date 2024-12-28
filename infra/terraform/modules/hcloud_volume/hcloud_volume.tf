resource "hcloud_volume" "volume" {
  for_each          = var.volume_conf
  name              = "${var.org_name}-${var.app_name}-${terraform.workspace}-${each.key}"
  size              = each.value.size
  location          = each.value.location
  format            = each.value.format
  automount         = each.value.automount
  delete_protection = each.value.delete_protection
}