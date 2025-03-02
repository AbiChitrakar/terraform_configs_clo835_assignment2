variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the SSH key pair to use"
  default     = "clo835-a2"
}
