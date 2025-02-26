output "vpc_id" {
  value = module.network.vpc_id
}

output "vpc_cidr_block" {
  value = module.network.vpc_cidr_block
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "subnet_cidr_blocks" {
  value = module.network.subnet_cidr_blocks
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value = module.ec2.public_ip
}
