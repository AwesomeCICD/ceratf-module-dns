output "r53_subdomain_zone_name" {
  value = aws_route53_zone.subdomain_zone.name
}

output "r53_subdomain_zone_id" {
  value = aws_route53_zone.subdomain_zone.zone_id
}

output "r53_subdomain_zone_name_aux" {
  value = (var.aux_zone_id ? aws_route53_zone.subdomain_zone_aux[0].name : "")
}

output "r53_subdomain_zone_id_aux" {
  value = (var.aux_zone_id ? aws_route53_zone.subdomain_zone_aux[0].id : "")
}