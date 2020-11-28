module "network" {
  source         = "./network"
  vpc_cidr_range = var.vpc_cidr_range
  common_tags = local.common_tags
  gitlab_subnet_descriptors = var.gitlab_subnet_descriptors
}