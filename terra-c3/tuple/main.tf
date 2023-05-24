variable "my_instance" {
    description = "multiple variable"
    type = tuple([ string, number, bool ])
    default = [ "t2.micro", 1, true ]
}

resource "aws_instance" "ec2_instance" {
    instance_type = var.my_instance[0]
    count = var.my_instance[1]
    monitoring = var.my_instance[2]

    ami = "ami-0889a44b331db0194"

    tags = {
        Name = "tuple-instances"
    }
}