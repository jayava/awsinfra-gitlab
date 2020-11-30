resource "aws_route53_zone" "base-domain-public" {
  name = var.base_domain_name
  tags = merge(var.common_tags,
  {
    Name = "Base Domain"
  })
}