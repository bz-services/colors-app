# Route Table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.bz_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bz_igw.id
  }
}

# Route Table Association for Public Subnet 1
resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.bz_public_subnet_1.id
  route_table_id = aws_route_table.public.id
}

# Route Table Association for Public Subnet 2
resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.bz_public_subnet_2.id
  route_table_id = aws_route_table.public.id
}