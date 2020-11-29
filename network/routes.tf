resource "aws_internet_gateway" "gitlab-igw" {
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(var.common_tags, {
    Name = "gitlab-internet-gateway"
  })
}

resource "aws_eip" "eip" {
  for_each = local.gitlab_public_subnets
  vpc = true
  tags = merge(var.common_tags, {
    Name = format("gitlab-public-subnets-eip-%s", each.key)
  })
}

resource "aws_nat_gateway" "gitlab-natgw" {
  for_each = aws_subnet.gitlab-public-subnets
  allocation_id = aws_eip.eip[*].id
  subnet_id = each.value.id
  depends_on = [
    aws_internet_gateway.gitlab-igw]
  tags = merge(var.common_tags, {
    Name = format("gitlab-ngw-%s", each.key)
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