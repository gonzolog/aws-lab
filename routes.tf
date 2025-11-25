# Public Route Table
# For any IP that does not belong to the VPC, send traffic to the Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# Elastic IP (Static IP) for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

# NAT Gateway in the public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "lab-nat-gateway"
  }
}

# Private Route Table
# If trying to reach any IP outside the VPV - Send traffic to the NAT gateway next
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.lab.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "lab-private-rt"
  }
}

# Associate private subnet with the private route table
# Only accepts connections from inside the VPC
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
