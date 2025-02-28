variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
}

variable "key_name" {
  description = "Name of the SSH key pair to use"
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
}
