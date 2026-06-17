module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  name               = var.name
  environment        = var.environment
  owner              = var.owner
}

module "iam" {
  source = "../../modules/iam"

  name        = var.name
  environment = var.environment
  owner       = var.owner
}

module "ec2_instance" {
  source = "../../modules/ec2"

  ami_id                = var.ami_id
  instance_type         = var.instance_type
  instance_profile_name = module.iam.instance_profile_name
  subnet_id             = module.vpc.public_subnet_id

  name        = var.name
  environment = var.environment
  owner       = var.owner
}