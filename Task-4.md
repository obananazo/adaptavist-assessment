# Task 4: Terraform - Basic Infrastructure

## Description

Using Terraform, sketch out infrastructure that included:

- VPC with
  - 2 public
  - 2 private subnets
  - across 2 different AZs
- Internet gateway and routing
  - public subnets can reach the internet
  - private subnets have no access to the internet

**Deliverable:**
One ore more `.tf` files that should pass `terraform validate`

## Let's go

I have to check the terraform docs (love those) and some old infra code I wrote years ago (👴) to refresh my memory.

Trying my best not to ruin the fun (ab)using AI.

![cat working GIF](https://tenor.com/en-GB/view/working-cat-laptop-gif-14805491.gif)

Ok, so after setting up the basic resources using the TF docs I did have to research due to my lack of expertise and confidence in network configurations.

Check it out here: ![task-4 tf directory](./Task-4-terraform/)
