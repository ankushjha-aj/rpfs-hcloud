# Define firewall rules as a map of objects
variable "firewall_rules" {
  description = "Map of firewall rules configurations"
  type = map(object({
    direction       = string
    protocol        = string
    port            = string
    source_ips      = list(string)
    destination_ips = list(string)
    description     = string
  }))
}

# Network ID for attaching the firewall
variable "network_id" {
  description = "ID of the network to attach the firewall to"
  type        = string
}

# Organization name for resource naming
variable "org_name" {
  description = "Organization name for resource naming"
  type        = string
}

# Application name for resource naming
variable "app_name" {
  description = "Application name for resource naming"
  type        = string
}

