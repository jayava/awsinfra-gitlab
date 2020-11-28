locals {
  common_tags = {
    Environment = format("%s-%s", var.env, var.region)
  }

  env = merge(yamldecode(file("env/${var.TERRAFORM_CLOUD_WORKSPACE_NAME}.yaml")))
}