resource "aws_acm_certificate" "base-domain-certificate" {
  domain_name = format("*.%s", var.base_domain_name)
  validation_method = "DNS"
  tags = merge(var.common_tags,
  {
    Name = "GitLab Base Domain Cert"
  })
}

resource "aws_route53_record" "certificate-validation-record" {
  for_each = {
  for dvo in aws_acm_certificate.base-domain-certificate.domain_validation_options : dvo.domain_name => {
    name = dvo.resource_record_name
    record = dvo.resource_record_value
    type = dvo.resource_record_type
  }
  }
  allow_overwrite = true
  name = each.value.name
  records = [
    each.value.record]
  ttl = 60
  type = each.value.type
  zone_id = aws_route53_zone.base-domain-public.zone_id
}

resource "aws_acm_certificate_validation" "certificate-validation" {
  certificate_arn = aws_acm_certificate.base-domain-certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate-validation-record : record.fqdn]
}