output "gitlab_vpc_id" {
  value = aws_vpc.gitlab-vpc.id
}

output "gitlab-public-subnet-a" {
  value = aws_subnet.gitlab-public-subnet-a.id
}

output "gitlab-public-subnet-b" {
  value = aws_subnet.gitlab-public-subnet-b.id
}
output "gitlab-private-subnet-a" {
  value = aws_subnet.gitlab-private-subnet-a.id
}

output "gitlab-private-subnet-b" {
  value = aws_subnet.gitlab-private-subnet-b.id
}
