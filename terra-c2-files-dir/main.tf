# Define EC2 instances
resource "aws_instance" "instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count

  tags = {
    Name = "instance1"
  }
}

resource "aws_instance" "instance2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count

  tags = {
    Name = "instance2"
  }
}
