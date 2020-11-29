resource "aws_subnet" "gitlab-public-subnets" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.gitlab-vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr_range, 8, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = merge(var.common_tags,
  {
    Name = format("gitlab-public-subnets-%s", element(var.availability_zones, count.index))
  })
}

resource "aws_subnet" "gitlab-private-subnets" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.gitlab-vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr_range, 8, length(var.availability_zones) + count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = merge(var.common_tags,
  {
    Name = format("gitlab-public-subnets-%s", element(var.availability_zones, count.index))
  })
}



