resource "aws_internet_gateway" "gitlab-igw" {
  vpc_id = aws_vpc.gitlab-vpc.id
  tags = merge(var.common_tags, {
    Name = "gitlab-internet-gateway"
  })
}

resource "aws_eip" "eip" {
  count = length(var.availability_zones)
  vpc = true
  tags = merge(var.common_tags, {
    Name = format("gitlab-public-subnets-eip-%s", count.index)
  })
}

resource "aws_nat_gateway" "gitlab-ngw" {
  count = length(var.availability_zones)
  allocation_id = aws_eip.eip[count.index].id
  subnet_id = aws_subnet.gitlab-public-subnets[count.index].id
  tags = merge(var.common_tags, {
    Name = format("gitlab-ngw-%s", element(var.availability_zones, count.index))
  })
  depends_on = [
    aws_internet_gateway.gitlab-igw]
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

resource "aws_route_table" "gitlab-private-route-tbl" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.gitlab-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gitlab-ngw[count.index].id
  }
  tags = merge(var.common_tags,
  {
    Name = format("gitlab-private-route-table-%s", element(var.availability_zones, count.index))
  })
}

resource "aws_route_table_association" "gitlab-public-route-tbl-assoc" {
  count = length(var.availability_zones)
  route_table_id = aws_route_table.gitlab-public-route-tbl.id
  subnet_id = aws_subnet.gitlab-public-subnets[count.index].id
}

resource "aws_route_table_association" "gitlab-private-route-tbl-assoc" {
  count = length(var.availability_zones)
  route_table_id = aws_route_table.gitlab-private-route-tbl.id
  subnet_id = aws_subnet.gitlab-private-subnets[count.index].id
}
