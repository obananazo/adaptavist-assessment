# Task 5: Ansible - Configuration Management

## Description

Write an Ansible playbook targeting a host group called `webservers`

Verify:

- Apache is installed & enabled on boot (common distro)
- `/var/www/html/index.html` is created from a template using a variable `site_name`
- Apache only reloads when the template actually changes

**Deliverable:**
YAML playbook + Jinja2 template

## Let's go

Initially skipped this task but came back after having a look at Ansible for Task 10.

Using Ubuntu.

`inventory.yaml`:

```yml
[webservers]
server1 ansible_host=192.168.1.10 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
```

`playbook.yaml`:

```yml
---
- name: Install Apache
  hosts: webservers
  become: yes
  vars:
    site_name: "Adaptavist"

  tasks:
    - name: Install Apache package
      apt:
        name: apache2
        state: present

    - name: Start and enable Apache service
      service:
        name: apache2
        state: started
        enabled: yes

    - name: Create index.html from template
      template:
        src: index.html.j2
        dest: /var/www/html/index.html
      notify: Reload on change

    - name: Reload on change
      service:
        name: apache2
        state: reloaded
```

`index.html.j2`:

```jinja
<html>
    <head>
        <title>{{ site_name }}</title>
    </head>
    <body>
        <h1>Welcome to {{ site_name }}!</h1>
    </body>
</html>
```

Tried avoiding AI here.
