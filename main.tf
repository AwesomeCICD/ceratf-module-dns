#----
# ROUTE 53 RESOURCES
# Creates a subdomain and DNS delegation for the target region
#---

# Creates the subdomain's Route 53 public hosted zone
resource "aws_route53_zone" "subdomain_zone" {
  name          = "${var.circleci_region}.${var.root_zone_name}."
  comment       = "Subdomain for CircleCI ${upper(var.circleci_region)} region"
  force_destroy = false
  tags = var.common_tags
}


# Creates an NS record set in the root domain's hosted zone
# This causes DNS queries for the subdomain to be forwarded to the subdomain's DNS servers 
resource "aws_route53_record" "root_zone_delegation_ns_record" {
  zone_id = var.root_zone_id
  name    = "${var.circleci_region}.${var.root_zone_name}."
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.subdomain_zone.name_servers
}