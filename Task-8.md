# Task 8: AWS Architecture & Resilience

## Description

A REST API runs on a single EC2 instance, PostgreSQL runs locally on the same box.
The business wants better availability and less manual work.

Describe how to redesign this using AWS managed services (5-8 bullet points):

- How would the app scale out & back in?
- How the DB handles durability, backups and failover
- How to approach monitoring, logging, alerting

**Deliverable:**
A short bullet-point architecture proposal

## Let's go

- Ditch the EC2. They are costly and have too much management overhead. Containerize it to ECS (Fargate) instead.
  - Add an auto-scaling policy (watching requests and/or CPU usage)
- Move the DB to Aurora (fully managed, resilient by default (multi AZ))
  - Enable automated backups to S3
  - Create a read-replica for failover
- Ship logs to CloudWatch, create CW Alarms
- Maybe add tracing using X-Ray?
