locals {
  env = merge(yamldecode(file("env/${var.TERRAFORM_CLOUD_WORKSPACE_NAME}.yaml")))

  common_tags = {
    Environment = format("%s-%s", local.env.name, local.env.aws.region)
  }

  gitlab_subnets = tomap({
  for sbd in local.env.network.subnets :
  sbd.name => object({
    az: sbd.az
    cidr: sbd.cidr
    type: sbd.type
  })
  })
}