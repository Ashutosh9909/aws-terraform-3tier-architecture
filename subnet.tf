# Creating Public Subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  count = 2

  tags = {
    Name = "public-sub-${count.index + 1}"
  }
}

# Creating Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Private-Sub"
  }
}

data "aws_subnets" "ashu" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }

  tags = {
    Tier = "Public"
  }
}
