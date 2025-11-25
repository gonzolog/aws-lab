# VPC
resource "aws_vpc" "lab" {
  cidr_block = "10.0.0.0/16"
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.lab.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Private subnet
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.lab.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lab.id
}
