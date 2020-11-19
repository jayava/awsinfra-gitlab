resource "aws_vpc" "gitlab-vpc" {
  cidr_block = var.vpc_cidr_range
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(
    var.common_tags,
    {
      Name = "gitlab-vpc"
    },
  )
}
