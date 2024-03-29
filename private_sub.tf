# Define private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidr
}

# Create NAT gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

# Create Elastic IP for NAT gateway
resource "aws_eip" "nat_eip" {
  vpc = true
}

# Create Route Table for private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block        = "0.0.0.0/0"
    nat_gateway_id    = aws_nat_gateway.nat_gateway.id
  }
}

# Associate private subnet with private route table
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}