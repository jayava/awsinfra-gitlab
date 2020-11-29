variable "vpc_cidr_range" {
  description = "VPC cidr range"
}

variable "availability_zones" {
  description = "All AZs the network is being scaled into"
  type = list(string)
}

variable "common_tags" {
  description = "common tags"
}