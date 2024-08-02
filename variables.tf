variable "root_zone_id" {
  description = "Route53 hosted zone ID for the root domain."
}

variable "root_zone_name" {
  description = "Route53 hosted zone name, e.g. circleci-fieldeng.com."
}

variable "aux_zone_id" {
  description = "Route53 hosted zone ID for the aux domain. Empty to omit."
}

variable "aux_zone_name" {
  description = "Route53 hosted zone name, e.g. circleci-labs.com. Empty to omit."
}

variable "circleci_region" {
  description = "Internal CircleCI region name, e.g. namer, japac, emea."
}

variable "common_tags" {
  description = "Tags to be applied to all taggable resources."
  default     = {}
}
