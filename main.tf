resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "carlos-vpc"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "carlos-igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "carlos-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnets_cidr

  tags = {
    Name = "carlos-private-subnet"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "carlos-public-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "carlos-private-route-table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_main_route_table_association" "private_main_route_table_association" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_eip" "nat_elastic_ip" {
  vpc = true

  tags = {
    Name = "carlos-elastic-ip"
  }

  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_elastic_ip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "carlos-nat-gateway"
  }
}

resource "aws_security_group" "vpc_ssh_sg" {
  name        = "vpc_ssh_sg"
  description = "Allow SSH inbound traffic for VPC"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH access within VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "carlos-vpc-ssh-sg"
  }
}

resource "aws_security_group" "public_ssh_sg" {
  name        = "public_ssh_sg"
  description = "Allow public inbound SSH traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "Public SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "carlos-public-ssh-sg"
  }
}
