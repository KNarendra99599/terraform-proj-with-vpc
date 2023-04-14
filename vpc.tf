resource "aws_vpc" "dev" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "dev"
  }
}


resource "aws_subnet" "dev-pub-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "dev-pub-1"
  }

}


resource "aws_subnet" "dev-pub-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "dev-pub-2"
  }

}


resource "aws_subnet" "dev-pub-3" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "dev-pub-3"
  }

}

resource "aws_subnet" "dev-pvt-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "dev-pvt-1"
  }

}



resource "aws_subnet" "dev-pvt-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "dev-pvt-2"
  }

}

resource "aws_subnet" "dev-pvt-3" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.12.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3

  tags = {
    Name = "dev-pvt-3"
  }

}



resource "aws_internet_gateway" "dev-IGW" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev-IGW"
  }
}

resource "aws_route_table" "dev-pub-RT" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-IGW.id
  }

  tags = {
    Name = "dev-pub-RT"
  }
}


resource "aws_route_table_association" "dev-pub-1-a" {
  subnet_id      = aws_subnet.dev-pub-1.id
  route_table_id = aws_route_table.dev-pub-RT.id
}


resource "aws_route_table_association" "dev-pub-2-a" {
  subnet_id      = aws_subnet.dev-pub-2.id
  route_table_id = aws_route_table.dev-pub-RT.id
}

resource "aws_route_table_association" "dev-pub-3-a" {
  subnet_id      = aws_subnet.dev-pub-3.id
  route_table_id = aws_route_table.dev-pub-RT.id
}
