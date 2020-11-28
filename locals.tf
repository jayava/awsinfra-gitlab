locals {
  env = merge(yamldecode(file("env/${var.TERRAFORM_CLOUD_WORKSPACE_NAME}.yaml")))

  common_tags = {
    Environment = format("%s-%s", local.env.name, local.env.aws.region)
  }

  subnets = local.env.network.subnets

  gitlab_subnets = {
    subnets.public.pa.name = {
        az = subnets.public.pa.az
        cidr = subnets.public.pa.cidr
    }
    subnets.public.pb.name = {
      az = subnets.public.pb.az
      cidr = subnets.public.pb.cidr
    }
    subnets.private.pa.name = {
      az = subnets.private.pa.az
      cidr = subnets.private.pa.cidr
    }
    subnets.private.pb.name = {
      az = subnets.private.pb.az
      cidr = subnets.private.pb.cidr
    }
  }
}