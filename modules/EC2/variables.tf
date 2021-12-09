
variable "cidr" {
  description = "VPC cidr"
  type        = string
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
