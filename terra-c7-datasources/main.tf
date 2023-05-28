data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

resource "aws_instance" "my_instance" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
}

data "aws_instance" "my_instance_data" {
    instance_id = aws_instance.my_instance.id
}