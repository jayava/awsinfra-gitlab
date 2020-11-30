resource "aws_route53_zone" "base-domain-public" {
  name = var.base_domain_name
  tags = merge(var.common_tags,
  {
    Name = "Base Domain"
  })
}

resource "aws_route53_zone" "gitlab" {
  name = format("gitlab.%s", var.base_domain_name)
  tags = merge(var.common_tags,
  {
    Name = "Base Domain for hosting GitLab"
  })
  depends_on = [aws_route53_zone.base-domain-public]
}