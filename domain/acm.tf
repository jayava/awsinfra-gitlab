resource "aws_acm_certificate" "base-domain-certificate" {
  domain_name = format("*.%s", var.base_domain_name)
  validation_method = "DNS"
  tags = merge(var.common_tags,
  {
    Name = "GitLab Base Domain Cert"
  })
}