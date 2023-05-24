variable "ec2_count" {
    description = "No of ec2 instances to launch"
    type = number
    default = 3
}

resource "aws_instance" "ec2_instance" {
  count = var.ec2_count
  instance_type = "t2.micro"
  ami = "ami-0889a44b331db0194"
}