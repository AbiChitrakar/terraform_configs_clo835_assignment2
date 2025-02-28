resource "aws_vpc" "clo835-a2" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "clo835-a2"
  }
}

resource "aws_subnet" "clo835-a2-subnet" {
  vpc_id                  = aws_vpc.clo835-a2.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.clo835-a2.id

  tags = {
    Name = "clo835-a2-igw"
  }
}

resource "aws_route_table" "clo835-a2-rt" {
  vpc_id = aws_vpc.clo835-a2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "clo835-a2" {
  subnet_id      = aws_subnet.clo835-a2-subnet.id
  route_table_id = aws_route_table.clo835-a2-rt.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound and all outbound traffic"
  vpc_id      = aws_vpc.clo835-a2.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_sg"
  }
}
