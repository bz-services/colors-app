terraform {
  backend "s3" {
    bucket         = "bz-terraform-backend"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "bz-tfstate-locking"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "network" {
  source = "./modules/network"

  vpc_name              = "bz-vpc"
  vpc_cidr_block        = "10.0.0.0/16"
  availability_zones    = ["eu-central-1a", "eu-central-1b"]
  public_subnet_cidr_1  = "10.0.1.0/24"
  public_subnet_cidr_2  = "10.0.2.0/24"
  private_subnet_cidr_1 = "10.0.3.0/24"
  private_subnet_cidr_2 = "10.0.4.0/24"
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name         = "bz-cluster"
  task_definition_name = "bz-app"
  container_name       = "bz-app"
  container_memory     = 512
  container_cpu        = 256
  container_port       = 5000
  image_tag            = var.image_tag
  # VPC and Security Groups
  vpc_id             = module.network.vpc_id
  subnets            = module.network.public_subnet_ids
  security_groups    = [module.network.bz_security_group_id]
  lb_security_groups = [module.network.lb_security_group_id]
  desired_count      = 2
}