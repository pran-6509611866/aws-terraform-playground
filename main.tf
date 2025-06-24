terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc1" {
  source         = "./modules/vpc"
  name           = "vpc1"
  cidr_block     = var.vpc1_cidr
  public_subnet  = var.vpc1_public_subnet
  private_subnet = var.vpc1_private_subnet
  az             = var.aws_az
  enable_igw     = true
}

module "vpc2" {
  source         = "./modules/vpc"
  name           = "vpc2"
  cidr_block     = var.vpc2_cidr
  public_subnet  = ""
  private_subnet = var.vpc2_private_subnet
  az             = var.aws_az
  enable_igw     = false
}

module "vpc_peering" {
  source      = "./modules/peering"
  vpc_id      = module.vpc1.vpc_id
  peer_vpc_id = module.vpc2.vpc_id
  vpc1_rt_id  = module.vpc1.public_rt_id
  vpc2_rt_id  = module.vpc2.private_rt_id
  vpc1_cidr   = var.vpc1_cidr
  vpc2_cidr   = var.vpc2_cidr
}

module "sg_ec2_1" {
  source          = "./modules/sg"
  name            = "ec2-1-sg"
  vpc_id          = module.vpc1.vpc_id
  ssh_cidr        = ["0.0.0.0/0"]
  allow_icmp_cidr = [var.vpc2_cidr]
}

module "sg_ec2_2" {
  source          = "./modules/sg"
  name            = "ec2-2-sg"
  vpc_id          = module.vpc2.vpc_id
  ssh_cidr        = []
  allow_icmp_cidr = [var.vpc1_cidr]
}

module "ec2_1" {
  source                 = "./modules/ec2"
  name                   = "EC2-instance-1"
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.vpc1.public_subnet_id
  vpc_security_group_ids = [module.sg_ec2_1.sg_id]
  key_name               = var.key_name
}

module "ec2_2" {
  source                 = "./modules/ec2"
  name                   = "EC2-instance-2"
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.vpc2.private_subnet_id
  vpc_security_group_ids = [module.sg_ec2_2.sg_id]
  key_name               = null
}

output "ec2_1_public_ip" {
  value = module.ec2_1.public_ip
}

output "ec2_2_private_ip" {
  value = module.ec2_2.private_ip
}