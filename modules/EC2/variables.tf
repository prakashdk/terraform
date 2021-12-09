
variable "cidr" {
  description = "VPC cidr"
  type        = string
}

variable "ami" {
  description = "ami id of EC2 instance"
  default = "ami-0ed9277fb7eb570c9"
}
variable "instance_type" {
  description = "instance type of EC2 instance"
  default = "t2.micro"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "instance_count" {
  description = "Number of instance to be deployed"
  type        = number
  default     = 2
}

variable "route_table_count" {
  description = "Number of route table to be deployed"
  type        = number
  default     = 2
}

variable "subnet_cidrs" {
  description = "Subnet cidrs"
  type        = list
}

variable "subnet_azs" {
  description = "Subnet Availability zones"
  type        = list
}
