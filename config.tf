terraform {
  backend "s3" {
    bucket = "clo835-a2"
    key    = "Terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
