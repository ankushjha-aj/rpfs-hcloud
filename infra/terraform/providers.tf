# Define the Terraform configuration for required providers
terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }

  backend "s3" {
  }
  
}

# Configure the Hetzner Cloud provider
provider "hcloud" {
  token = "kN7WKJCGC2NsH0DvsRLNXOnqElZxzKNywoVYWTxXJamNtYqJwd31c3lU4aJBIHDQ"
}