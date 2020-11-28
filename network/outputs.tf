output "gitlab_vpc_id" {
  value = aws_vpc.gitlab-vpc.id
}

output "gitlab-subnets" {
  value = [for subnet in aws_subnet.gitlab-subnets: subnet.id]
}
