provider "aws" {
  region = "eu-west-1"  
}

module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = var.cidr_block
  name        = var.vpc_name
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = var.ami  
  ec2_type     = var.ec2_type
  key_name          = var.key_name  
  name              = var.ec2_name
  private_key_path  = var.private_key_path
}
