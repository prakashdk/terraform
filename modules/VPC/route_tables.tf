resource "aws_route_table" "PrakashRTs" {
  vpc_id = aws_vpc.PrakashVPC.id

  dynamic route {
      for_each = toset(count.index==0?[1]:[])
      content{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.PrakashIG.id
      }
  }

  count = var.route_table_count

  tags = {
    Name = "PrakashTF-${count.index==1?"Priv":"Pub"}RT"
    environment="training"
  }
}

resource "aws_route_table_association" "PrakashRTAs" {
  subnet_id      = aws_subnet.PrakashSubnets[count.index].id
  route_table_id = aws_route_table.PrakashRTs[count.index<2?0:1].id
  count = var.route_table_count*2
}
