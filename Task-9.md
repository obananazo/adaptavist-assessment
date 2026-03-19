# Task 9: Networking - Debugging Connectivity

## Description

A service is running in a container on an EC2 instance. The service can't reach an external HTTPS API, but `curl` works.

What steps & commands would you use to chase this down, checking:

- Inside the container
- On the EC2 host
- Security groups and NACLs
- Routing and DNS

State what you're trying to confirm or rule out.

**Deliverable:**
An ordered troubleshooting checklist

## Let's go

`curl`ing the EC2 directly shows that the EC2 itself is fine and reachable. Networking to it works, the machine itself responds.

In my experience this is *usually* a security group issue. This is a low hanging fruit I'd check in the AWS console (true state) first.

Afterwards checking logs, if available. Maybe there's tracing and a dashboard too? This might give more clues as to which errors are happening (hopefully, if set up to catch them in the first place).

If possible, `ssh` into the EC2 and check the processes using `htop` or similar. Trying to verify if the container inside it is running at all.

The try to `ping` / `curl` the external API from inside it. What does it return? Timeout? 403? (Is this a network issue?)

Then I'd double check the routing & DNS in the AWS console and map it out in my head or a quick diagramm sketch. Does it make sense?

Is the DNS route set up correctly? `curl`ing the endpoint to see what results come back.

Lastly I'd check the NACLS if all above did not help yet, purely because this is my weakest link.
