output "vpc_id" {
  value = aws_vpc.clo835-a2.id
}

output "public_subnet_id" {
  value = aws_subnet.clo835-a2-subnet.id
}

output "ssh_security_group_id" {
  value = aws_security_group.allow_ssh.id
}
