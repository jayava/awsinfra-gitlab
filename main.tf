module "network" {
  source = "./network"
  vpc_cidr_range = local.env.network.vpc-cidr-block
  availability_zones = local.env.network.azs
  common_tags = local.common_tags
}

module "domain" {
  source = "./domain"
  base_domain_name = local.env.domain
  gitlab_vpc_id = module.network.gitlab_vpc_id
  common_tags = local.common_tags
}