output "region" {
  value = var.region
}

output "vpc_name" {
  value = var.vpc_name
}

output "vpc_id" {
  value = aws_vpc.project_vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

output "public_subnet_az1_id" {
  value = aws_subnet.public_gateway_subnet_az1.id
}

output "az1_gateway_subnet_cidr" {
  value = var.az1_gateway_subnet_cidr
}

output "az1_proxy_subnet_cidr" {
  value = var.az1_proxy_subnet_cidr
}

output "az1_compute_subnet_cidr" {
  value = var.az1_compute_subnet_cidr
}

output "az2_gateway_subnet_cidr" {
  value = var.az2_gateway_subnet_cidr
}

output "az2_proxy_subnet_cidr" {
  value = var.az2_proxy_subnet_cidr
}

output "az2_compute_subnet_cidr" {
  value = var.az2_compute_subnet_cidr
}


