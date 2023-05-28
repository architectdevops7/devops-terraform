variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
}
