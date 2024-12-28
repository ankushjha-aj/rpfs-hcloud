# Variable for Network CIDR Block
variable "network_cidr_block" {
  description = "The CIDR block for the network"
  type        = string
}

# Variable for subnet conf
variable "subnet_conf" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr_block   = string
    network_zone = string
  }))
}


# Variavble for Org Name
variable "org_name" {
  description = "Organization name for resource naming"
  type        = string
}

# Variable for App name
variable "app_name" {
  description = "Application name for resource naming"
  type        = string
}
