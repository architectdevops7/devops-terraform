variable "security_group_name" {
    type = string
    default = "my-sg"
}

variable "ingress_ports" {
    type = list(number)
    default = [22, 8080, 443]
}

resource "aws_security_group" "my_security_group" {
    name = var.security_group_name
    description = "My Security group"

    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
      
    }
}