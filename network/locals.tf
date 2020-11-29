locals {
  tags = merge(var.common_tags)

  gitlab_private_subnets = tomap({
    for k,v in var.gitlab_subnet_descriptors : k => v if v.type == "private"
  })

  gitlab_public_subnets = tomap({
  for k,v in var.gitlab_subnet_descriptors : k => v if v.type == "public"
  })
}