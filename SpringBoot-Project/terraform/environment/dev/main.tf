module "network" {
  source               = "../../modules/network"
  vpc_name             = var.vpc_name
  cidr_block           = var.cidr_block
  public_subnet_cidr   = var.public_subnet_cidr
  availability_zone    = var.availability_zone
}

module "compute" {
  source           = "../../modules/compute"
  instance_type    = var.instance_type
  ami_id           = var.ami_id
  public_subnet_id = module.network.public_subnet_id
  vpc_id           = module.network.vpc_id
  user_data  = file("${path.module}/user_data.sh")
}

