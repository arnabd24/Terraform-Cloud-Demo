terraform {
  required_version = "~>1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  #if you are running on cloud no profile information should be mentioned
}

resource "aws_instance" "my-ec2-vm" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  key_name      = "demo"
  tags = {
    "Name" = "production-${terraform.workspace}-0"
  }
}