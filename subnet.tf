resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                                = "public-a"
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/ecommerce-eks" = "shared"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                                = "public-b"
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/ecommerce-eks" = "shared"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name                                      = "private-a"
    "kubernetes.io/role/internal-elb"        = "1"
    "kubernetes.io/cluster/ecommerce-eks"    = "shared"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name                                      = "private-b"
    "kubernetes.io/role/internal-elb"        = "1"
    "kubernetes.io/cluster/ecommerce-eks"    = "shared"
  }
}