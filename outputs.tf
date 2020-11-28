output "gitlab_vpc_id" {
  value = module.network.gitlab_vpc_id
}

output "gitlab-subnets" {
  value = module.network.gitlab-subnets
}

output "aws_region" {
  value = local.env.aws.region
}