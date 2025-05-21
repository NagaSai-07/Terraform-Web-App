terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
    source          = "../../modules/vpc"
    vpc_cidr        = var.vpc_cidr
    public_subnet_cidrs  = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    azs             = var.azs
    project         = var.project
}

module "security" {
  source           = "../../modules/security"
  vpc_id           = module.vpc.vpc_id
  project          = var.project
  key_name         = var.key_name
  public_key_path  = var.public_key_path
}
module "ec2" {
    source        = "../../modules/ec2"
    subnet_id     = module.vpc.public_subnet_ids[0]
    instance_type = var.instance_type
    key_name      = var.key_name
    ami_id        = var.ami_id
    project       = var.project
    security_group_ids = [module.security.web_sg_id]
    user_data = file("${path.module}/scripts/install_web.sh")
}
