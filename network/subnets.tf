resource "aws_subnet" "gitlab-subnets" {
  for_each = toset(var.gitlab_subnet_descriptors)
  vpc_id = aws_vpc.gitlab-vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az
}


