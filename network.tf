# Creating Internet-Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "MyVPC-IG"
  }
}

# Creating Elastic IP
resource "aws_eip" "myeip" {
  //instance = aws_instance.web.id
  vpc      = true
}

# Creating NAT-Gateway
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "NG"
  }

# To ensure proper ordering, it is recommended to add an explicit dependency
# on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

# Creating Route Tables
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "MyRoute"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rtb.id
  count = 2
}

//Adding NAT Gateway into the default main route table
resource "aws_default_route_table" "dfltrtb" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "dfltrtb"
  }
}