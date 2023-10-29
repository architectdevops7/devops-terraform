variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "elb_name" {
  description = "Name for ELB"
  type = string
  default = "myelb"
}

variable "lc_name" {
  description = "Name for the Launch Configuration"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "target_group_name" {
  description = "Name for the target group"
  type        = string
}

variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
}

variable "min_size" {
  description = "Minimum size for the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size for the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity for the Auto Scaling Group"
  type        = number
}


variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "user_data" {
  description = "User data for the EC2 instances"
  type        = string
}