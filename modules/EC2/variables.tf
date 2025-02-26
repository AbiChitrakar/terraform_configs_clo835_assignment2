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

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}
variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets"
  type        = list(string)
}
