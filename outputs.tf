output "gitlab_vpc_id" {
  value = module.network.gitlab_vpc_id
}

output "gitlab-public-subnets" {
  value = module.network.gitlab-public-subnets
}

output "gitlab-private-subnets" {
  value = module.network.gitlab-private-subnets
}

output "aws_region" {
  value = local.env.aws.region
}