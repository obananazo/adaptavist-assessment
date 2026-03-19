# Task 7: Kubernetes / Container Orchestration

## Description

Create a deployment for either Kubernetes or Docker Compose

Kubernetes:

- 3 replicas of NGINX serving static content
- Expose them externally using a LoadBalancer (port 80)

Docker Compose:

- Runs nginx
- Maps host port 80 to container port 80
- Mounts `./html` on the host to `/usr/share/nginx/html/ inside the container

**Deliverable:**
YAML manifest for either solution

## Let's go

I'm choosing `docker-compose` since nothing beats simplicity. (Kubernetes is usually overkill)

```yaml
services:
    nginx:
        image: nginx:latest
        ports:
            - "80:80"
        volumes:
            - ./html:/usr/share/nginx/html
```

This was easy :-)

*(Well, I mean I chose the easy option so.. :P)*
