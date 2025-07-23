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

provider "docker" {}

resource "docker_image" "springboot" {
  name = "${var.dockerhub_username}/springboot-demo"
}

resource "docker_container" "springboot_container" {
  image = docker_image.springboot.latest
  name  = "springboot_container"
  ports {
    internal = 8081
    external = 8081
  }
}
