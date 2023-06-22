# # create local variables

# create vpc
resource "aws_vpc" "project_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}
