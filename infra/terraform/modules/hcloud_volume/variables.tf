variable "volume_conf" {
  description = "Map of volume configurations"
  type = map(object({
    size              = number
    location          = string
    format            = string
    automount         = bool
    delete_protection = bool
  }))
}

variable "org_name" {
  description = "Organization name for resource naming"
  type        = string
}

variable "app_name" {
  description = "Application name for resource naming"
  type        = string
}
