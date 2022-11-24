variable "root_zone_id" {
  description = "Route53 hosted zone ID for the root domain."
}

variable "root_zone_name" {
  description = "Route53 hosted zone name, e.g. circleci-labs.com."
}

variable "circleci_region" {
  description = "Internal CircleCI region name, e.g. namer, japac, emea."
}

variable "common_tags" {
  description = "Tags to be applied to all taggable resources."
  default = {}
}