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
  source          = "./modules/networking"
  name_prefix     = "tta"
  ssh_client_cidr = var.ssh_client_cidr
}

module "load-balancer" {
  source      = "./modules/load-balancer"
  name_prefix = "tta"
  vpc_id      = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
}
