variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets"
  type        = list(string)
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
}

variable "instance_name" {
  description = "The name to assign to the EC2 instance"
  type        = string
}
variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
}
