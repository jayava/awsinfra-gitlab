locals {
  env = merge(yamldecode(file("env/${var.TERRAFORM_CLOUD_WORKSPACE_NAME}.yaml")))

  common_tags = {
    Environment = format("%s-%s", local.env.name, local.env.aws.region)
  }

  subnets = local.env.network.subnets

  gitlab_subnets = {
    "${local.subnets.public.pa.name}" = {
        az = local.subnets.public.pa.az
        cidr = local.subnets.public.pa.cidr
    }
    "${local.subnets.public.pb.name}" = {
      az = local.subnets.public.pb.az
      cidr = local.subnets.public.pb.cidr
    }
    "${local.subnets.private.pa.name}" = {
      az = local.subnets.private.pa.az
      cidr = local.subnets.private.pa.cidr
    }
    "${local.subnets.private.pb.name}" = {
      az = local.subnets.private.pb.az
      cidr = local.subnets.private.pb.cidr
    }
  }
}