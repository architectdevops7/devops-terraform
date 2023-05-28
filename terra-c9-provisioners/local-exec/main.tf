provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

# EC2 Instance resource
resource "aws_instance" "example" {
  ami           = "ami-0ab193018f3e9351b"  # Replace with your desired AMI ID
  instance_type = "t2.micro"

  # File provisioner to copy a local file to the instance
  provisioner "local-exec" {
    command = "touch index.html"
  }
}