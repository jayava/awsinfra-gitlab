output "gitlab_vpc_id" {
  value = aws_vpc.gitlab-vpc.id
}

output "gitlab-public-subnets" {
  value = [for subnet in aws_subnet.gitlab-public-subnets: subnet.id]
}

output "gitlab-private-subnets" {
  value = [for subnet in aws_subnet.gitlab-private-subnets: subnet.id]
}
