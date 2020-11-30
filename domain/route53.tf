resource "aws_route53_zone" "base-domain-public" {
  name = var.base_domain_name
  tags = merge(var.common_tags,
  {
    Name = "Base Domain"
  })
}

//resource "aws_route53_zone" "base-domain-private" {
//  name = var.base_domain_name
//  vpc {
//    vpc_id = var.gitlab_vpc_id
//  }
//}

resource "aws_route53_zone" "gitlab" {
  name = format("gitlab.%s", var.base_domain_name)
  tags = merge(var.common_tags,
  {
    Name = "Base Domain for hosting GitLab"
  })
}

resource "aws_route53_record" "gitlab-ns" {
  zone_id = aws_route53_zone.gitlab.id
  name = aws_route53_zone.gitlab.name
  type = "NS"
  ttl = "30"
  records = aws_route53_zone.gitlab.name_servers
}