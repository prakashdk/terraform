
module "VPC" {
  source = "./modules/VPC"

  cidr         = var.cidr
  vpc_name     = var.vpc_name
  subnet_cidrs = var.subnet_cidrs
  subnet_azs   = var.subnet_azs
}

module "EC2" {
  source = "./modules/EC2"

  instance_name   = var.ec2_instance_name
  key_pair        = var.key_pair
  alb_name        = var.alb_name
  vpc_id          = module.VPC.vpc_id
  file_path       = var.file_path
  web_src = var.web_src
  security_groups = [aws_security_group.PrakashEC2-SG.id]
  public_subnets  = slice(module.VPC.subnets, 0, 2)
}

resource "null_resource" "ec2-file-copy" {
  connection{
    type = "ssh"
    host = module.EC2.ec2_instances[count.index].public_ip
    user = "ec2-user"
    private_key = file("C://Users//VC//Downloads//MyAWSKey.pem")
  }
  count = length(module.EC2.ec2_instances)

  provisioner "file" {
    source=var.web_src
    destination = "/tmp/MySQL-connection.php"
  }
  provisioner "remote-exec" {
    inline=["sudo cp /tmp/MySQL-connection.php /var/www/html/MySQL-connection.php"]
  }
}

module "RDS" {
  source = "./modules/RDS"

  db_identifier   = var.db_identifier
  username        = var.username
  password        = var.password
  dbname          = var.dbname
  security_groups = [aws_security_group.PrakashMySQL-SG.id]
  private_subnets = slice(module.VPC.subnets, 2, 4)
}



