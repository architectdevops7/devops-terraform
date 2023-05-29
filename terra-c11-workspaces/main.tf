# Provider configuration
provider "aws" {
  region = "us-west-2"
  access_key = "AKIAYP4HU2GD3BFOBZP6"
  secret_key = "tJoWqR5g1LakOOn4WRPs7gmq6cEt1yjcoW0N469v"  # Replace with your desired AWS region
}

terraform {
  cloud {
    organization = "example-org-dc5050"

    workspaces {
      name = "dev"
    }
  }
}

# Security Group resources
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Security group for web servers"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
}

# EC2 Instance resource
resource "aws_instance" "web_instance" {
  ami           = "ami-0ab193018f3e9351b"  # Replace with your desired AMI ID
  instance_type = "t2.micro"

  # security_groups = [aws_security_group.web_sg.id]
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "web-instance"
  }
}
