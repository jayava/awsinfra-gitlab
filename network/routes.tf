resource "aws_internet_gateway" "gitlab-igw" {
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(var.common_tags, {
    Name = "gitlab-internet-gateway"
  })
}

resource "aws_eip" "eip" {
  count = length(values(var.gitlab_subnet_descriptors.name))
  vpc = true
  tags = merge(var.common_tags, {
    Name = format("gitlab-public-subnets-eip-%s", count.index)
  })
}

resource "aws_nat_gateway" "gitlab-natgw" {
  for_each = aws_subnet.gitlab-public-subnets
  allocation_id = aws_eip.eip[count.index].id
  subnet_id =   aws_subnet.gitlab-public-subnets[each.key].id
  tags = merge(var.common_tags, {
    Name = format("gitlab-ngw-%s", aws_subnet.gitlab-public-subnets[each.key].id)
  })
}

resource "aws_route_table" "gitlab-public-route-tbl" {
  vpc_id = aws_vpc.gitlab-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gitlab-igw.id
  }
  tags = merge(var.common_tags,
  {
    Name = "public-subnets-route-table"
  })
}

//resource "aws_route_table" "gitlab-private-route-tbl" {
//  vpc_id = aws_vpc.gitlab-vpc.id
//  route {
//    cidr_block = "0.0.0.0/0"
//    nat_gateway_id = aws_nat_gateway.gitlab-natgw[*].id
//  }
//  tags = merge(var.common_tags,
//  {
//    Name = "private-subnets-route-table"
//  })
//}