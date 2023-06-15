# Winglang Domains

This repo is managing DNS for domains in the Monada [dnsimple](https://dnsimple.com/) account.

Currently being managed:

- winglang.ai (placeholder for testing)

## Scope

This repo is purely focused on managing the DNS entries for the domains itself. It enables:

1. Easy access management via Github, rather than having to share credentials for a single dnsimple account
1. Context of what changed and why
1. Automation

This repo is not concerned about wiring up 3rd party sources like e.g. AWS Route53 automatically, since this would become quite complex pretty soon when targeting various accounts.

## Zone Delegation

The suggested approach to keep things smooth:

- Create a zone in AWS Route53 or a similar service manually
- Get the name servers for that zone
- Put them into the corresponding `NS` records in a dnsimple `Record`.
- Create a pull request

## Contributions

For DNS changes or additions create a pull request please. Once merged, it'll be automatically applied via Github Actions from the `main` branch.

All resources of the dnsimple provider can be found in the [docs](https://registry.terraform.io/providers/bgpat/dnsimple/latest/docs)

## Usage

Set `DNSIMPLE_TOKEN` and `DNSIMPLE_ACCOUNT` [tokens](https://support.dnsimple.com/articles/api-access-token/) as env variables.

```
npm install
wing compile -t tf-aws domains.w
cd target/domains.tfaws
terraform init && terraform apply
```


