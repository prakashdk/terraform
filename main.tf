
module "VPC" {
  source = "./modules/VPC"
  
  cidr="149.0.0.0/16"
  vpc_name="PrakashTF"
  subnet_cidrs=["149.0.1.0/24","149.0.2.0/24","149.0.3.0/24","149.0.4.0/24"]
  subnet_azs=["us-east-1a","us-east-1b","us-east-1a","us-east-1b"]
}

module "EC2" {
  source = "./modules/EC2"

  security_groups = [aws_security_group.PrakashEC2-SG.id]
  public_subnets=slice(module.VPC.subnets,0,2)
  instance_name = "Prakash"
  vpc_id = module.VPC.vpc_id
}
