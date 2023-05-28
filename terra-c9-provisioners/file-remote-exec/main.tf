provider "aws" {
  region = "us-west-2" # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"
  key_name      = "aws-keypair"
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/Downloads/aws-keypair")
    host        = self.public_ip
  }
  
  provisioner "file" {
    source      = "~/Downloads/nvirginia.pem"
    destination = "/home/ec2-user/nvirginia.pem"
  }

  provisioner "local-exec" {
    command = "touch local.txt"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install apache2 -y",
      "sudo systemctl start apache2",
    ]
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello from user data!"
    touch /tmp/user_data_file.txt
  EOF
}

resource "aws_key_pair" "example_key_pair" {
  key_name   = "aws-keypair"
  public_key = "copy-paste-public-key"
  
}

resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "Security group for the web server"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
    