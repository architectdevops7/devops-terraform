# Define the VPC module
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.name
  }
}

# Define the subnet module
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.subnet_name
  }
}

# Define the internet gateway module
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

# Define the route table module
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Route Table"
  }
}

# Associate the subnet with the route table
resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}
