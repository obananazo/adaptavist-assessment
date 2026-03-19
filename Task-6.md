# Task 6: Docker & Best Practices

## Description

The team wants to run Jira Data Center in Docker, close to a prod setup.

Describe good Docker practices specifically for Jira (8-12 bullet points):

1. Which base image & how to keep it updated (official vs custom, version pinning)
2. How to manage persistent data for Jira home directory & DB config
3. How Jira should be exposed (reverse proxy, ports, TLS termination, etc.)
4. Resource limits, JVM memory settings, general performance tuning
5. Handling of logging & backups
6. Security: running non-root, dealing with secrets

**Deliverable:**
A bullet list 12 sentences of explanation per item *(//very specific lol)*

## Let's go

**1 a: Which image to use?**

A lightweight image that is stable, secure and needs minimal managing overhead; working out of the box. Custom images should be avoided unless the tradeoffs are considered and it's absolutely neccessary (otherwise have fun managing all that).

Checking the DockerHub there is an `atlassian/jira-software` official image. This makes things quick and easy. No need to reinvent the wheel.

**1 b: How to keep it updated (version pinning)?**

I'd avoid using `latest` and pin the last recent stable version that worked specifically in our environment. Who knows if a new update might break things and considering that Jira is essential for project management... yeah, no.

Updating should be tested (automated testing?) in a dev env before potentially plagueing the whole team. Usually a pipeline triggered on version bumping (e.g. GitHub Actions?) should run to update the image and re-deploy it into the containers/VMs per env.

**2. How to manage persistent data for Jira home directory?**

Ship the data to a database (PostgreSQL?) by adding it to the docker network (could be templated in a `docker-compose`). Also create a docker volume (helps against loosing data on restarts).

**3. How Jira should be exposed (reverse proxy, ports, TLS)?**

A reverse proxy seems essential for a prod environment. Data should be encrypted in-transit via TLS. However, I do not know the specifics for implementing this from the top of my head (and googling & "pasting" my answer here defeats the purpose of this assessment)

**4. Resource limits (JVM memory, performance tuning)**

To be perfectly frank: this is outside my expertise (especially JVM).

**5. Handling of logging & backups?**

Logging depends. It could be a simple as CloudWatch logs & dashboards to something like Loki & Grafana.

Automated database backups should occur daily (db backup, volume snapshots, retention policies). Backup strategies **must** be tested thoroughly (and occasionally)!

**6. Security (non-root user, secrets)?**

Jira should obviously be run as a non-root user (everything tech should be).
Users get roles and role-based access with the least privilege permissions needed to get their tasks done.

According to a quick search Jira (`>=10.2`) is encrypting (AES-256) stored passwords.
(Alternatively, AWS KMS & SSM exist)

I don't know why I mention this but from some envs I've seen I still have to...
***DON'T HARDCODE CREDENTIALS!!!*** Yes, even in dev! This should be setup from the very beginning. Use env vars and manage secrets.

Every "temporary" practice becomes permanent. "Oh I just want to quickly test..." \*forgets\*

Maybe consider using AWS WAF and isolate the data network into it's own private subnet.

Finally, audit. In an environment respecting security (which many don't) regular audits should be in place. Maybe there's automated tools for that too out there?
