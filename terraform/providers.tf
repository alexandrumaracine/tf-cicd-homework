terraform {
  backend "local" {
    path = "../tfstate-remote/terraform.tfstate"
  }
}

provider "null" {}
