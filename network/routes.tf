resource "aws_internet_gateway" "gitlab-igw" {
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(var.common_tags, {
    Name = "gitlab-internet-gateway"
  })
}

resource "aws_route_table" "gitlab-public-route-tbl" {
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(var.common_tags,
  {
    Name = "public-route-table"
  }
  )
}