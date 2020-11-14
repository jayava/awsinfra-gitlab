locals {
  common_tags = {
    Environment = format("%s-%s", var.env, var.region)
  }
}