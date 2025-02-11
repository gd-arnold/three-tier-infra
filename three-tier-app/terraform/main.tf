terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "networking" {
  source      = "./modules/networking"
  name_prefix = "tta"
  ssh_client_cidr = var.ssh_client_cidr
}
