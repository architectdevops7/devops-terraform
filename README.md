# terraform to install ec2 intances
```
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  count         = 2  # Change the count to the number of instances you want to create
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = "your-keypair-name"     # Replace with your existing EC2 key pair name

  iam_instance_profile {
    name = "your-iam-role-name"  # Replace with the IAM role name with permissions to install Docker (if needed)
  }

  user_data = <<-EOT
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo service docker start
    sudo usermod -aG docker ec2-user
  EOT

  tags = {
    Name = "Docker-EC2-Instance-${count.index + 1}"
  }
}
```
