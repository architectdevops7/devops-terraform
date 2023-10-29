resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "mygw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_route_table1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygw.id
  }
}

resource "aws_route_table_association" "route_table_association1" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.my_route_table1.id
}

resource "aws_security_group" "my_sg" {
  name = "my-security-group"
  description = "Security group for my-sg"
  vpc_id = aws_vpc.my_vpc.id
  depends_on = [aws_vpc.my_vpc]

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "my-sg"
  }
}

resource "aws_elb" "my_elb" {
  name = var.elb_name
  security_groups = [aws_security_group.my_sg.id]
  subnets = [aws_subnet.public.id]
  

  listener {
    instance_port = 80
    instance_protocol = "HTTP"
    lb_port = 80
    lb_protocol = "HTTP"
  }
}

resource "aws_launch_configuration" "my_lc" {
  name                        = var.lc_name
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.my_sg.id]
  user_data                   = var.user_data
  associate_public_ip_address = true
}

resource "aws_lb_target_group" "my_target_group" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id
  target_type = "instance"
}

resource "aws_autoscaling_group" "my_asg" {
  name                 = var.asg_name
  launch_configuration = aws_launch_configuration.my_lc.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = [aws_subnet.public.id]
  target_group_arns    = [aws_lb_target_group.my_target_group.arn]
}
