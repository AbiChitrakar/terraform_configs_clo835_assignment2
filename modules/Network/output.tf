output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "subnet_ids" {
  value = aws_subnet.main[*].id
}

output "subnet_cidr_blocks" {
  value = aws_subnet.main[*].cidr_block
}
