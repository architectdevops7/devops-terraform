# terraform to install ec2 intances
```
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_security_group" "example" {
  name_prefix = "allow-all-traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  count         = 2  # Change the count to the number of instances you want to create
  ami           = "ami-06ca3ca175f37dd66"  # Replace with your desired AMI ID
  instance_type = "t3.large"
  key_name      = "nvirginia"     # Replace with your existing EC2 key pair name



  user_data = <<-EOT
    #!/bin/bash
    sudo yum install docker -y
    sudo systemctl start docker
    sudo usermod -aG docker ec2-user
  EOT

  tags = {
    Name = "Docker-EC2-Instance-${count.index + 1}"
  }

  vpc_security_group_ids = [aws_security_group.example.id]
}
```
