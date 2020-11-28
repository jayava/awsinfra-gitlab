variable "vpc_cidr_range" {
  description = "VPC cidr range"
}

variable "gitlab_subnet_descriptors" {
  description = "gitlab subnet descriptors"
  type = map (
  object({
    az: string
    cidr: string
  }))
}

variable "common_tags" {
  description = "common tags"
}