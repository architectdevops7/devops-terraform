variable "instance_check" {
    description = "Flag to compare before launching ec2 instance"
    type = bool
    default = true
}

resource "aws_instance" "ec2_instance" {
  count = var.instance_check ? 1 : 0
  instance_type = "t2.micro"
  ami = "ami-0889a44b331db0194"
  tags = {
    Name = "ec2-by-bool"
  }
}