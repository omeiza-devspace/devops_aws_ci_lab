# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az1 
resource "aws_eip" "nat_eip" {
  vpc = aws_vpc.project_vpc.id
  depends_on = [aws_internet_gateway.internet_gateway]

  tags = {
    Name = "${var.vpc_name}-eip"
  }
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_gateway_subnet_az1.id
  depends_on    = [aws_internet_gateway.internet_gateway]

  tags = {
    Name = "${var.vpc_name}-nat"
  }
}
