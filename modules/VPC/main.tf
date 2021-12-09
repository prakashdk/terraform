
resource "aws_vpc" "PrakashVPC" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name        = var.vpc_name
    environment = "training"
  }
}


resource "aws_internet_gateway" "PrakashIG" {
  vpc_id = aws_vpc.PrakashVPC.id

  tags = {
    Name        = "${var.vpc_name}-ig"
    environment = "training"
  }
}

