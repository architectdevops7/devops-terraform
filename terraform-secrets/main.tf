provider "random" {}

# Generate a random secret password
data "random_password" "my_secret_password" {
  length = 16
  special = true
}

# Output the generated secret password
output "secret_password" {
  value = data.random_password.my_secret_password.result
}

# You can also store the secret password as a variable
variable "db_password" {
  description = "Database password"
  type        = string
  default     = data.random_password.my_secret_password.result
}

# Use the secret password in other resources, for example, an AWS RDS instance
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "mydbuser"
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
