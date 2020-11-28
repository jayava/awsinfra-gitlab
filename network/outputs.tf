output "gitlab_vpc_id" {
  value = aws_vpc.gitlab-vpc.id
}

output "gitlab-subnets" {
  value = aws_subnet.gitlab-subnets[*].id
}
