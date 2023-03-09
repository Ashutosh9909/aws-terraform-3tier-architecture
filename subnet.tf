# Creating Public Subnet
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public-sub-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "public-sub-2"
  }
}

# Creating Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1b"

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
