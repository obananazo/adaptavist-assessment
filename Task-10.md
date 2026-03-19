# Task 10: End-to-End Automation Scenario

## Description

A small dev env is needed: 1 EC2 instance in a private subnet running NGINX, reachable through an ALB in a public subnet.

How would you combine Terraform and Ansible to get this done, including:

- Which parts are handled by Terraform vs Ansible?
- The rough order to run things
- High-level thoughts on how to deal with state file & secrets

**Deliverable:**
A short design description (bullet points / narrative)


## Let's go

Haven't used Ansible until now. Let's take a look at some examples.

![brb cat gif](https://tenor.com/en-GB/view/bat-bats-brb-crawling-velvetvamp-gif-9925090822946290425.gif)

Hm okay reminds me of GitHub Actions.

Right off the bat I can say that:

- Terraform handles the infrastructure:
  - EC2 instance
  - Subnet & security groups
  - ALB
  - SSM (for secrets management)
  - (S3 Bucket for TF state, if not present)
  - (DB table for tf state lock, if not present)

Ansible is responsible for installing & configuring NGINX.

First I would create the infra, then the playbook (and apply each in their order).

State is managed via Terraform (S3 bucket).

Secrets are managed using SSM.

Very high-level explanation :-)
