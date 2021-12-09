
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

resource "aws_instance" "PrakashInstances" {
  ami                         = "ami-0ed9277fb7eb570c9"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.PrakashEC2-SG.id]
  key_name                    = "MyAWSKey"
  subnet_id                   = aws_subnet.PrakashSubnets[count.index].id
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
    Name        = "${var.vpc_name}-ec2-${count.index+1}"
    environment = "training"
  }
}
