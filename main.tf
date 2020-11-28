module "network" {
  source         = "./network"
  vpc_cidr_range = local.env.network.vpc-cidr
  common_tags = local.common_tags
  gitlab_subnet_descriptors = var.gitlab_subnet_descriptors
}