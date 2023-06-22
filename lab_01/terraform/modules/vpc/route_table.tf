locals {
  global_cidr = "0.0.0.0"
}

# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = local.global_cidr
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.vpc_name}-public-table"
  }
}


# associate all public subnets to the public route table
resource "aws_route_table_association" "public_subnets_assoc_az1" {
  subnet_id      = aws_subnet.public_gateway_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnets_assoc_az2" {
  subnet_id      = aws_subnet.public_gateway_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}


# create route table and add public route
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block     = local.global_cidr
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.vpc_name}-private-table"
  }
}


# associate all private subnets to the private route table

resource "aws_route_table_association" "proxy_subnet_assoc_az1" {
  subnet_id      = aws_subnet.private_proxy_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "proxy_subnet_assoc_az2" {
  subnet_id      = aws_subnet.private_proxy_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "compute_subnet_assoc_az1" {
  subnet_id      = aws_subnet.private_compute_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "compute_subnet_assoc_az2" {
  subnet_id      = aws_subnet.private_compute_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}