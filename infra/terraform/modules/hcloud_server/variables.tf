# Define server configurations as a map of objects
variable "server_conf" {
  description = "Map of server configurations"
  type = map(object({
    server_type        = string
    image              = string
    location           = string
    backups            = bool
    delete_protection  = bool
    rebuild_protection = bool
  }))
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

# Network ID for attaching the firewall
variable "network_id" {
  description = "ID of the network to attach the firewall to"
  type        = string
}

# Path to the SSH public key file
variable "public_key_value" {
  description = "Path to the SSH public key file used for authentication"
  default     = ""
}

# Firewall ID for server attachment
variable "firewall_id" {
  description = "ID of the firewall to attach to servers"
  type        = string
}

variable "volume_ids" {
  description = "Map of volume names to their IDs"
  type        = map(string)
}

variable "volume_attachments" {
  description = "Map of volume attachment configurations"
  type = map(object({
    volume_key = string
    server_key = string
    automount  = bool
  }))
}