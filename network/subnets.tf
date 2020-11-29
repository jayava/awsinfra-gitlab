resource "aws_subnet" "gitlab-public-subnets" {
  for_each = local.gitlab_public_subnets
  vpc_id = aws_vpc.gitlab-vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  tags = merge(var.common_tags,
  {
    Name = each.key
  })
}

resource "aws_subnet" "gitlab-private-subnets" {
  for_each = local.gitlab_private_subnets
  vpc_id = aws_vpc.gitlab-vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az
  tags = merge(var.common_tags,
  {
    Name = each.key
  })
}



