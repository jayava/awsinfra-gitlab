region = "us-east-2"

env = "gitlab-jayava-tf"

vpc_cidr_range = "10.0.0.0/16"

gitlab_subnet_descriptors = {
  "gitlab-public-a" = {
    az: "us-east-2a"
    cidr: "10.0.0.0/24"
  },
  "gitlab-public-b" = {
    az: "us-east-2b"
    cidr: "10.0.2.0/24"
  },
  "gitlab-private-a" = {
    az: "us-east-2a"
    cidr: "10.0.1.0/24"
  },
  "gitlab-private-b" = {
    az: "us-east-2b"
    cidr: "10.0.3.0/24"
  }
}
