provider "aws" {
  region = local.env.aws.region
  version = "~> 3.15.0"
}