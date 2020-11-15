terraform {
  required_version = "~> 0.12.0"

  backend "remote" {}
}

provider "azurerm" {
  version = "=2.20.0"
  features {}
}