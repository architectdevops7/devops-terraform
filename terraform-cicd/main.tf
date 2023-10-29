# Configure the AWS provider
provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

# EC2 Instance resource
resource "aws_instance" "example_instance" {
  ami           = "ami-0ab193018f3e9351b"  # Replace with your desired AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

# Configure the S3 backend for remote state storage
terraform {
  backend "s3" {
    bucket         = "your-bucket-name"
    key            = "example.tfstate"
    region         = "your-aws-region"
    access_key     = "your-access-key"
    secret_key     = "your-secret-key"
    dynamodb_table = "your-dynamodb-table-name"
  }
}