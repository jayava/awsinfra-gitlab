module "network" {
  source = "./network"
  vpc_cidr_range = local.env.network.vpc-cidr-block
  availability_zones = local.env.network.azs
  common_tags = local.common_tags
}