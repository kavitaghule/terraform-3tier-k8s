provider "vault" {
    address="https://127.0.0.0:8080"
    token= "fsgxsaxs"
}
data "vault_generic_secret" "aws" {
path = "secret/aws_cred"
}

module "vpc" {
  source     = "./module/vpc"
  vpc_cidr   = var.vpc_cidr
  azs        = var.azs
}

module "eks" {
  source         = "./module/eks"
  cluster_name   = var.cluster_name
  vpc_id         = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "rds" {
  source          = "./module/rds"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  db_name         = var.db_name
  db_username     = var.db_username
  db_password     = var.db_password
  private_subnets = module.vpc.private_subnets
  rds_sg          = module.vpc.db_sg_id
}


module "iam" {
  source = "./module/iam"
}

