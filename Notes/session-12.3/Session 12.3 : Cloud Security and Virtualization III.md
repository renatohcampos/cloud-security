# Bootcamp PPT#34
## Session 12.3 Cloud Security & Virtualization III
**Tuesday November 24, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 606132

### Expectations

- Cover Load Balancing & Redundancy
- Create a load balancer.

### Ansible Playbooks

- Ansible read YAML
- YAML Aint Markup
- `sudo docker container list -a`
- `sudo docker start <containerName>` 
- `sudo docker attach <containerName>`
- `cd /etc/ansible/my-playbook.yml`
- `ansible-playbook my-playbook.yml`

```
---
- name: My first playbook
	hosts: webservers
	become: true
	tasks:
	
	- name: Install apache httpd (state=present is optional)
	  apt:
	  	name: apache2
	  	state: present
```

- Load Balancer provides the external IP address
  - **health probe** function

