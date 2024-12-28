#Output for network id
output "network_id" {
  description = "The ID of the created network"
  value       = hcloud_network.network.id
}