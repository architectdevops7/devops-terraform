provider "aws" {
  region = "us-west-2"
}

module "vpc_module" {
  source = "../vpc-module"

  name                   = "MyVPC"
  cidr_block             = "10.0.0.0/16"
  subnet_name            = "MySubnet"
  subnet_cidr_block      = "10.0.1.0/24"
  availability_zone      = "us-west-2a"
  map_public_ip_on_launch = true
}