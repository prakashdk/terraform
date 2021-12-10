variable "cidr" {
  description = "cidr of vpc"
  type        = string
  default     = "149.0.0.0/16"
}

variable "vpc_name" {
  description = "name of the vpc"
  type        = string
  default     = "PrakashTF"
}

variable "subnet_cidrs" {
  description = "Subnet cidrs"
  type        = list(any)
  default     = ["149.0.1.0/24", "149.0.2.0/24", "149.0.3.0/24", "149.0.4.0/24"]
}

variable "subnet_azs" {
  description = "Subnet Availability zones"
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b"]
}

variable "ec2_instance_name" {
  description = "name of ec2 instance to be created"
  type        = string
  default     = "Prakash"
}

variable "db_identifier" {
  description = "name of db server to be created"
  type        = string
  default     = "prakash-mysql"
}

variable "dbname" {
  description = "name of db to be created inside the server"
  type        = string
  default     = "mydb"
}
variable "username" {
  description = "username of the db server"
  type        = string
  default     = "prakash"
}

variable "password" {
  description = "password of the db server (should be 8 characters)"
  type        = string
  default     = "prakashd"
}
variable "key_pair" {
  description = "name of the key pair"
  type        = string
  default     = "MyAWSKey"

}
variable "alb_name" {
  type        = string
  description = "name of the alb"
  default     = "PrakashTF-ALB"
}

variable "file_path" {
  description = "the path of shell script to provide user-data for ec2 instance"
  type = string
  default = "D://Internship//Terraform//Terraform Day4//install_web.sh"
}

variable "web_src" {
  description = "src path of web"
  type = string
  default = "D://Internship//Terraform//Terraform Day4//MySQL-connection.php"
}