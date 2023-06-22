# create vpc
module "vpc" {
  source = "../modules/vpc"

  region   = var.region
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  az1_gateway_subnet_cidr = var.az1_gateway_subnet_cidr
  az1_proxy_subnet_cidr   = var.az1_proxy_subnet_cidr
  az1_compute_subnet_cidr = var.az1_compute_subnet_cidr

  az2_gateway_subnet_cidr = var.az2_gateway_subnet_cidr
  az2_proxy_subnet_cidr   = var.az2_proxy_subnet_cidr
  az2_compute_subnet_cidr = var.az2_compute_subnet_cidr
}
