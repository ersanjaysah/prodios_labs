resource "aws_vpc" "custom_VPC" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "my-custom-vpc"
  }
}

resource "aws_internet_gateway" "custom_IGW" {
  vpc_id = aws_vpc.custom_VPC.id

  tags = {
    Name = "custom-IGW"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.custom_VPC.id
  cidr_block        = var.public_subnets_cidr
  availability_zone = var.public_subnet_AZ

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_IGW.id
  }

  tags = {
    Name = "custom_RT"
  }
}

resource "aws_route_table_association" "custom_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.custom_route_table.id
}

// private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.custom_VPC.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_AZ

  tags = {
    Name = "private-subnet"
  }
}

// elastic ip we can use eip in NAT_GW
resource "aws_eip" "custom_EPI" {
  network_border_group = "eu-north-1"
  domain               = "vpc"
}

resource "aws_nat_gateway" "custom_NAT_GW" {
  allocation_id     = aws_eip.custom_EPI.allocation_id
  subnet_id         = aws_subnet.public_subnet.id
  connectivity_type = "public"

  tags = {
    Name = "custom-NAT-GW"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.custom_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.custom_NAT_GW.id
  }

  tags = {
    Name = "private_custom_RT"
  }
}

resource "aws_route_table_association" "pvt_RT_Association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}
