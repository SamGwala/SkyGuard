resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.name}-VPC"
    Environment = var.environment
    Owner       = var.owner
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.name}-Public-Subnet"
    Environment = var.environment
    Owner       = var.owner

  }
}

resource "aws_internet_gateway" "gw"{  #attach internet gateway to the vpc 
    vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.name}-Internet-Gateway"
    Environment = var.environment
    Owner       = var.owner
  }
}

resource "aws_route_table" "public" { 
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id   #when traffic matches this route send it to the IGW
  }
    tags = {
    Name        = "${var.name}-Public-Route-Table"
    Environment = var.environment
    Owner       = var.owner
    }
  }

  resource "aws_route_table_association" "main"{
    subnet_id        = aws_subnet.public.id
    route_table_id   = aws_route_table.public.id
  }



