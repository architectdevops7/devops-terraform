# Provider configuration
provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
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
  ami           = "ami-035bf26fb18e75d1b"  # Replace with your desired AMI ID
  instance_type = "t2.micro"

  # security_groups = [aws_security_group.web_sg.id]
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "web-instance"
  }
}
