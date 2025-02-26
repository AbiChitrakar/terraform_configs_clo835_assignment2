provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.12.0"
}
# Data source for availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}


module "network" {
  source       = "./modules/Network"
  cidr_block   = var.cidr_block
  vpc_name     = var.vpc_name
  subnet_cidrs = var.subnet_cidrs
}

module "ec2" {
  source        = "./modules/EC2"
  region        = var.region
  subnet_ids    = module.network.subnet_ids
  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name
}
