variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "elb_name" {
  description = "Name for the ELB"
  type        = string
  default     = "my-elb"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-west-1a"]
}

variable "lc_name" {
  description = "Name for the Launch Configuration"
  type        = string
  default     = "my-lc"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-051ed863837a0b1b6"
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "user_data" {
  description = "User data for the EC2 instances"
  type        = string
  default     = "#!/bin/bash\necho 'Hello, World!' > index.html\npython -m SimpleHTTPServer 80"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-west-1a"
}

variable "target_group_name" {
  description = "Name for the target group"
  type        = string
  default     = "my-target-group"
}

variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
  default     = "my-asg"
}

variable "min_size" {
  description = "Minimum size for the Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size for the Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired capacity for the Auto Scaling Group"
  type        = number
  default     = 2
}
