terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
 
# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
access_key = var.access_key
secret_key = var.secret_key
}
resource "aws_instance" "myinstance" {
  ami           = var.ami-id
  instance_type = var.instance_type
  count = 2
  tags = {
    Name = "myinstance ${count.index+1}"
}
}
