output "r53_subdomain_zone_name" {
  value = aws_route53_zone.subdomain_zone.name
}

output "r53_subdomain_zone_id" {
  value = aws_route53_zone.subdomain_zone.zone_id
}