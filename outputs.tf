output "gitlab_vpc_id" {
  value = module.network.gitlab_vpc_id
}

output "env" {
  value = local.env
}