variable "instance_types" {
    description =   "different ec2 instance types"
    type        =   list(string)
    default     =   ["t2.micro","m5.large","c5.xlarge"]
}

resource "aws_instance" "ec2_instances" {
    count           =   length(var.instance_types)
    instance_type   =   element(var.instance_types, count.index)
    ami             =   "ami-0889a44b331db0194"
    availability_zone   =   "us-east-1a"
    tags = {
        Name = "terra-c3-${count.index + 1}"
    }
}
