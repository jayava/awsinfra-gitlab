output "route53_base_domain_zone_id" {
  value = aws_route53_zone.base-domain-public.id
}
output "route53_gitlab_subdomain_zone_id" {
  value = aws_route53_zone.gitlab.id
}
