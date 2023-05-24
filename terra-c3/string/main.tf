variable "name" {
    description = "Name of the ec2 instance"
    type        = string
    default     = "terra-c3"
}

resource "aws_instance" "ec2_instance" {
    instance_type = "t2.micro"
    ami           = "ami-0889a44b331db0194"
    tags          = {
        Name = var.name
    }
}