variable "vpc_cidr_range" {
  description = "VPC cidr range"
}

variable "gitlab_subnet_descriptors" {
  description = "gitlab subnet descriptors"
  type = map (
  object({
    name: string
    az: string
    cidr: string
    type: string
  }))
}

variable "common_tags" {
  description = "common tags"
}