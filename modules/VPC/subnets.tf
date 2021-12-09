
resource "aws_subnet" "PrakashSubnets" {
  vpc_id            = aws_vpc.PrakashVPC.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.subnet_azs[count.index]
  count         = length(var.subnet_azs)
  tags = {
    Name        = "${var.vpc_name}-${count.index<2?"Pub":"Priv"}-${var.subnet_azs[count.index]}"
    environment = "training"
  }
}

