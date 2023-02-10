terraform {
  required_version = "~>1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
}

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
}
variable "ec2_tag" {
  description = "This is EC2 Instance tag"
  type = string
}

provider "aws" {
  region  = var.aws_region
  #if you are running on cloud no profile information should be mentioned
}

resource "aws_instance" "my-ec2-vm" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  key_name      = "demo"
  tags = {
    "Name" = "${var.ec2_tag}-${terraform.workspace}-0"
  }
}