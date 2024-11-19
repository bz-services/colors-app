# Public Subnet for AZ1
resource "aws_subnet" "bz_public_subnet_1" {
  vpc_id                  = aws_vpc.bz_vpc.id
  cidr_block              = var.public_subnet_cidr_1
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet-1"
  }
}

# Public Subnet for AZ2
resource "aws_subnet" "bz_public_subnet_2" {
  vpc_id                  = aws_vpc.bz_vpc.id
  cidr_block              = var.public_subnet_cidr_2
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet-2"
  }
}

# Private Subnet for AZ1
resource "aws_subnet" "bz_private_subnet_1" {
  vpc_id                  = aws_vpc.bz_vpc.id
  cidr_block              = var.private_subnet_cidr_1
  availability_zone       = var.availability_zones[0]
  tags = {
    Name = "${var.vpc_name}-private-subnet-1"
  }
}

# Private Subnet for AZ2
resource "aws_subnet" "bz_private_subnet_2" {
  vpc_id                  = aws_vpc.bz_vpc.id
  cidr_block              = var.private_subnet_cidr_2
  availability_zone       = var.availability_zones[1]
  tags = {
    Name = "${var.vpc_name}-private-subnet-2"
  }
}