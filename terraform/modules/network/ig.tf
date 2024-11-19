# Internet Gateway for Public Subnets
resource "aws_internet_gateway" "bz_igw" {
  vpc_id = aws_vpc.bz_vpc.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}