terraform {
  required_version = "~> 1.1.3"
  required_providers {
    googleworkspace = {
      source = "hashicorp/googleworkspace"
      version = "~> 0.6.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.2.2"
    }
  }
}