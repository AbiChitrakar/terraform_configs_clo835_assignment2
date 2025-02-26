terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
data "terraform_remote_state" "clo835-a2" {
  backend = "s3"
  config = {
    bucket = "clo835-a2"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
resource "aws_instance" "main" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = data.terraform_remote_state.clo835-a2.outputs.subnet_ids[0]
  associate_public_ip_address = true # Ensure public IP is assigned

  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo systemctl start docker
    sudo usermod -a -G docker ec2-user

    curl -sLo kind https://kind.sigs.k8s.io/dl/v0.11.0/kind-linux-amd64
    sudo install -o root -g root -m 0755 kind /usr/local/bin/kind
    rm -f ./kind

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm -f ./kubectl

    cat <<EOF2 > kind.yaml
    kind: Cluster
    apiVersion: kind.x-k8s.io/v1alpha4
    nodes:
    - role: control-plane
      image: kindest/node:v1.19.11@sha256:07db187ae84b4b7de440a73886f008cf903fcf5764ba8106a9fd5243d6f32729
      extraPortMappings:
      - containerPort: 30000
        hostPort: 30000
      - containerPort: 30001
        hostPort: 30001
    EOF2

    kind create cluster --config kind.yaml
  EOF

  tags = {
    Name = var.instance_name
  }
}
