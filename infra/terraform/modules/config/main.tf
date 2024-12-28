# Define local variables for better readability and reusability.
locals {
  config_path = var.config_path != "" ? var.config_path : "${path.root}/config"
  environment = var.environment != "" ? var.environment : terraform.workspace

  # Define template variables for use in template files.
  tpl_vars = {
    environment = local.environment
    terraform = {
      workspace = terraform.workspace
    }
  }

  # List YAML files from base and environment directories
  files_base = toset([
    for f in fileset(local.config_path, "*.yaml") : f
  ])
  files_env = toset([
    for f in fileset("${local.config_path}/${local.environment}", "*.yaml") : f
  ])

  # Decode YAML files with template variables
  configs_base = [
    for f in local.files_base :
    yamldecode(templatefile("${local.config_path}/${f}", local.tpl_vars))
  ]
  configs_env = [
    for f in local.files_env :
    yamldecode(templatefile("${local.config_path}/${local.environment}/${f}", local.tpl_vars))
  ]

  # Merge configurations with environment-specific configs taking precedence
  config_env  = merge(local.configs_env...)
  config_base = merge(local.configs_base...)
  configs     = merge(local.config_base, local.config_env)
}