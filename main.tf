module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  project         = var.project
}

module "security" {
  source          = "./modules/security"
  vpc_id          = module.vpc.vpc_id
  project         = "${var.project}-web-sg"
  key_name        = var.key_name
  public_key_path = var.public_key_path
}