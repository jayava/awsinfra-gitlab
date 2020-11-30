output "route53_base_domain_zone_id" {
  value = aws_route53_zone.base-domain-public.id
}

output "acm_certificate_id" {
  value = aws_acm_certificate.base-domain-certificate.id
}
