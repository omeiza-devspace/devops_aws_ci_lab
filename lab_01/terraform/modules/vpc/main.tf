# create local variables
locals {
    global_cidr = "0.0.0.0"
     
    name_tags = {
        az_a_public_subnet_gateway = ""
        az_a_private_subnet_proxy = ""
        az_a_private_subnet_compute = ""
        az_a_private_subnet_data = ""

        az_b_public_subnet_gateway = ""
        az_b_private_subnet_proxy = ""
        az_b_private_subnet_compute = ""
        az_b_private_subnet_data = ""

        az_c_public_subnet_gateway = ""
        az_c_private_subnet_proxy = ""
        az_c_private_subnet_compute = ""
        az_c_private_subnet_data = ""
    }
} 

# create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "${var.project_name}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "${var.project_name}-igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]

  map_public_ip_on_launch = true

  tags      = {
    Name    = "${var.project_name}-public-net-az1"
  }
}

# create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "${var.project_name}-public-net-az2"
  }
}

# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id                  = aws_vpc.vpc.id

  route {
    cidr_block = locals.global_cidr
    gateway_id = aws_internet_gateway.internet_gateway
  }

  tags       = {
    Name    = "${var.project_name}-public-route-table"
  }
}

# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id                        =  vpc_id                  = aws_vpc.vpc.id


  route_table_id      = aws_subnet.public_subnet_az1.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = 
  route_table_id      =   aws_subnet.public_subnet_az1.id

}

# create private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                   = 
  cidr_block               = 
  availability_zone        = 
  map_public_ip_on_launch  = 

  tags      = {
    Name    = 
  }
}

# create private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                   = 
  cidr_block               = 
  availability_zone        = 
  map_public_ip_on_launch  = 

  tags      = {
    Name    = 
  }
}

# create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                   = 
  cidr_block               = 
  availability_zone        = 
  map_public_ip_on_launch  = 

  tags      = {
    Name    = 
  }
}

# create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                   = 
  cidr_block               = 
  availability_zone        = 
  map_public_ip_on_launch  = 

  tags      = {
    Name    = 
  }
}