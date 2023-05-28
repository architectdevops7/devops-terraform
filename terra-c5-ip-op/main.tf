variable "instance_type" {
  description = "Instance type for the ec2 instances"
  type = string
  default = "t2.micro"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0889a44b331db0194"
    instance_type = var.instance_type
}

output "public_ip" {
    description = "Fetch the public IP from ec2 instance"
    value = aws_instance.my_instance.public_ip
}

