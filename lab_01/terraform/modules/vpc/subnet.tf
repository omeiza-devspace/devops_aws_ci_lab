# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


############## Availability Zone 1 Subnets ##############

# create public subnet az1
resource "aws_subnet" "public_gateway_subnet_az1" {
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = var.az1_gateway_subnet_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-net-gw-az1"
  }
}


# create private proxy subnet az1
resource "aws_subnet" "private_proxy_subnet_az1" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = var.az1_proxy_subnet_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-net-prx-az1"
  }
}


# create private compute subnet az1
resource "aws_subnet" "private_compute_subnet_az1" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = var.az1_compute_subnet_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-net-cmp-az1"
  }
}

############## Availability Zone 2 Subnets ##############

# create public subnet az1
resource "aws_subnet" "public_gateway_subnet_az2" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block        = var.az2_gateway_subnet_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-net-gw-az2"
  }
}


# create private proxy subnet az2
resource "aws_subnet" "private_proxy_subnet_az2" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = var.az2_proxy_subnet_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-net-prx-az2"
  }
}


# create private compute subnet az2
resource "aws_subnet" "private_compute_subnet_az2" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = var.az2_compute_subnet_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-net-cmp-az2"
  }
}
