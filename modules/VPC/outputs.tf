
output "subnets" {
  value = [
      for subnet in aws_subnet.PrakashSubnets : subnet.id
  ]
}

output "vpc_id" {
    value = aws_vpc.PrakashVPC.id
}