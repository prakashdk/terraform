output "PublicDNS" {
    value = aws_lb.PrakashALB.dns_name
}

output "ec2_instances" {
    value = aws_instance.PrakashInstances
}