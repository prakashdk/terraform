variable "ami" {
  description = "ami id of EC2 instance"
  default = "ami-0ed9277fb7eb570c9"
}
variable "instance_type" {
  description = "instance type of EC2 instance"
  default = "t2.micro"
}
variable "instance_count" {
  description = "Number of instance to be deployed"
  type        = number
  default     = 2
}

variable "public_subnets" {
  description = "public subnets for ec2 instances"
  type = list
}
variable "security_groups" {
  description = "security groups for ec2 instances"
  type = list
}

variable "instance_name" {
  description = "name of the instance"
  type = string
}

variable "vpc_id" {
  description = "vpc id for target group"
  type = string
}