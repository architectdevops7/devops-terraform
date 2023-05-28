variable "instance_configuration" {
    description =   "Map the instance configuration"
    type        =   map(object({
        instance_type   =   string
        ami             =   string
        availability_zone   = string
    }))
    default = {
        instance1 = {
            instance_type   =   "t2.micro"
            ami             =   "ami-0889a44b331db0194"
            availability_zone   = "us-east-1a" 
        }
        instance2 = {
            instance_type   =   "m5.large"
            ami             =   "ami-0889a44b331db0194"
            availability_zone   = "us-east-1b" 
        }
    }
}

resource "aws_instance" "ec2_instances" {
    for_each        =   var.instance_configuration
    instance_type   =   each.value.instance_type
    ami             =   each.value.ami
    availability_zone   =   each.value.availability_zone
    tags = {
        Name = "terra-c3"
    }
}
