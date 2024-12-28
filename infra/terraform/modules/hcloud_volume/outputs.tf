output "volume_ids" {
  description = "Map of created volume IDs"
  value       = { for k, v in hcloud_volume.volume : k => v.id }
}