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
}

module "load-balancer" {
  source      = "./modules/load-balancer"
  name_prefix = "tta"
  vpc_id      = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  alb_sg_id = module.networking.alb_sg_id
}

module "application" {
    source = "./modules/application"
    name_prefix = "tta"
    vpc_id = module.networking.vpc_id
    application_subnet_ids = module.networking.application_subnet_ids
    application_sg_id = module.networking.application_sg_id
    alb_target_group_arn = module.load-balancer.application_tg_arn
}
