
# Define local variables
locals {
  configs = nonsensitive(module.config.configs) # Retrieve configurations from the config module
}

# Include a configuration module for managing shared or global configuration settings
module "config" {
  source = "./modules/config"
}

# Module for creating a network in the project
module "hcloud_network" {
  source             = "./modules/hcloud_network"
  org_name           = lookup(local.configs, "org_name")
  app_name           = lookup(local.configs, "app_name")
  subnet_conf        = lookup(local.configs, "subnet_conf")
  network_cidr_block = lookup(local.configs, "network_cidr_block")
}

# Module for creating a firewall in the project
module "hcloud_firewall" {
  source         = "./modules/hcloud_firewall"
  org_name       = lookup(local.configs, "org_name")
  app_name       = lookup(local.configs, "app_name")
  network_id     = module.hcloud_network.network_id
  firewall_rules = lookup(local.configs.firewall_conf, "rules")
}

module "hcloud_volume" {
  source      = "./modules/hcloud_volume"
  org_name    = lookup(local.configs, "org_name")
  app_name    = lookup(local.configs, "app_name")
  volume_conf = lookup(local.configs, "volume_conf")
}

# Module for creating a server in the project
module "hcloud_server" {
  source             = "./modules/hcloud_server"
  org_name           = lookup(local.configs, "org_name")
  app_name           = lookup(local.configs, "app_name")
  network_id         = module.hcloud_network.network_id
  firewall_id        = module.hcloud_firewall.firewall_id
  volume_ids         = module.hcloud_volume.volume_ids
  volume_attachments = lookup(local.configs, "volume_attachments")
  server_conf        = lookup(local.configs, "server_conf")
  public_key_value   = file("${path.module}/config/${terraform.workspace}/hetzner-tf.pub")
}

