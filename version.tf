terraform {
  required_version = ">= 0.12"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
  cloud {

    organization = "jsystem_szkolenie_terraform"

    workspaces {
      name = "jsystem-action-terraform"
    }
  }
}