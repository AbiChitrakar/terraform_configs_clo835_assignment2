provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.12.0"
}

module "network" {
  source             = "./modules/Network"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "ec2" {
  source            = "./modules/EC2"
  vpc_id            = module.network.vpc_id
  subnet_id         = module.network.public_subnet_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.network.ssh_security_group_id
  depends_on        = [module.network] # Ensures EC2 runs after Network

}
