variable "env" {
  description = "The name of the environment being created"
}

variable "region" {
  description = "SkyLab AWS region"
}

variable "vpc_cidr_range" {
  description = "CIDR range for VPC"
}

variable "gitlab_subnet_descriptors" {
  description = "gitlab subnet descriptors"
  type = set(
  object({
    az: string
    cidr: string
    name: string
  }))
}