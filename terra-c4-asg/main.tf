resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "Security group for the web server"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "my_elb" {
  name               = var.elb_name
  security_groups    = [aws_security_group.my_sg.id]
  availability_zones = var.availability_zones

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
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

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
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
  vpc_zone_identifier  = [aws_subnet.my_subnet.id]
  target_group_arns    = [aws_lb_target_group.my_target_group.arn]
}