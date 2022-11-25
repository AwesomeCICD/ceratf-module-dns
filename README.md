# ceratf-module-dns
Deploys a Route53 hosted zone for a CircleCI region.  Does the following:

- Deploys a Route53 zone for a subdomain 
- Deploys an NS record to the root domain to direct queries to the subdomain's nameservers

## Requirements

- Terraform >= 1.0.9
- aws-cli >= 2.8.3
- Access to state file from ceratf-deployment-global plan

## How to Use

1. Drop the [example module declaration](#example-usage) shown below into a Terraform plan and fill in the variables.
2. Run the Terraform plan.


## Terraform Variables

#### Required

| Name | Default | Description|
|------|---------|------------|
|root_zone_id| none |Route53 hosted zone ID for the root domain |
|root_zone_name| none |Route53 hosted zone name, e.g. `circleci-labs.com.` |
|circleci_region| none |Internal CircleCI region name, e.g. `namer`, `japac`, `emea` |


#### Optional

| Name | Default | Description|
|------|---------|------------|
|common_tags | `{}` | Map of tags that will be applied to all resources. |

## Terraform Outputs

| Name | Description|
|------|------------|
| r53_subdomain_zone_name | FQDN of newly-created subdomain. |
| r53_subdomain_zone_id | Hosted Zone ID of newly-created subdomain. |

## Example usage


```hcl
module "dns_test" {
  source = "git@github.com:AwesomeCICD/ceratf-module-dns.git"

  root_zone_name  = "example.com"
  root_zone_id    = "Z100XXXXXXXXXXXXXXXX"
  circleci_region = "foobar"
}
```

## Resources Created by Terraform

- aws_route53_zone.subdomain_zone
- aws_route53_record.root_zone_delegation_ns_record-ns
