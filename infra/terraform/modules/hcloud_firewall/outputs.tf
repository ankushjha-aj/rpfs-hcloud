# Output for Firewall ID
output "firewall_id" {
  description = "ID of the created firewall"
  value       = hcloud_firewall.firewall.id
}