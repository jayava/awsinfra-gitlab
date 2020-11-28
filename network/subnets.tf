resource "aws_subnet" "gitlab-public-subnet-a" {
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(
  var.common_tags,
  {
    Name = "gitlab-public-subnets-a"
  }
  }
}

resource "aws_subnet" "gitlab-public-subnet-b" {
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(
  var.common_tags,
  {
    Name = "gitlab-public-subnets-a"
  }
  )
}

resource "aws_subnet" "gitlab-private-subnet-a" {
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(
  var.common_tags,
  {
    Name = "gitlab-private-subnets-a"
  }
  )
}

resource "aws_subnet" "gitlab-private-subnet-b" {
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2b"
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(
  var.common_tags,
  {
    Name = "gitlab-private-subnets-b"
  }
  )
}



