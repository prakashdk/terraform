resource "aws_instance" "PrakashInstances" {
  ami                         = var.ami
  instance_type               = var.instance_type
  security_groups             = var.security_groups
  key_name                    = "MyAWSKey"
  subnet_id                   = var.public_subnets[count.index]
  associate_public_ip_address = true

  count = var.instance_count

  user_data = fileexists("install_web.sh") ? file("install_web.sh") : <<EOF
  #!bin/bash
sudo yum install httpd -y
sudo echo "<h1>Hello from terraform!</h1>" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
EOF

  tags = {
    Name        = "${var.instance_name}-ec2-${count.index+1}"
    environment = "training"
  }
}
