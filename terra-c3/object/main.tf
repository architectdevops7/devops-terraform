provider "aws" {
    region = "us-east-1"
}

variable "ec2_instance" {
    type = object({
        instance_type       =   string
        ami                 =   string
        availability_zone   =   string
})

    default = {
        instance_type       =   "t2.micro"
        ami                 =   "ami-0889a44b331db0194"
        availability_zone   =   "us-east-1a"
    }
}

resource "aws_instance" "ec2-instance" {
    instance_type   =   var.ec2_instance.instance_type
    ami             =   var.ec2_instance.ami
    availability_zone   =   var.ec2_instance.availability_zone
}