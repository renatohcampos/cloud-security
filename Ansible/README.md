## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![elk-diagram](../Diagrams/elk-diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select YAML files such as `filebeat.yml` may be used to install only certain pieces of it, such as Filebeat.

**filebeat.yml**

```
---
- name: installing and launching filebeat
  hosts: webservers
  become: yes
  tasks:

  - name: download filebeat deb
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
 
  - name: install filebeat deb
    command: dpkg -i filebeat-7.6.1-amd64.deb

  - name: drop in filebeat.yml 
    copy:
      src: /etc/ansible/filebeat-config.yml
      dest: /etc/filebeat/filebeat.yml

  - name: enable and configure system module
    command: sudo filebeat modules enable system

  - name: setup filebeat
    command: sudo filebeat setup

  - name: start filebeat service
    command: sudo service filebeat start
```

This document contains the following details:
- Description of the Topology

  Redundant web servers are accessed over HTTP through the load balancer. The JumpBox-Provisioner can be directly accessed through SSH, and can also SSH into all Web VMs, as well as the ELK-Net machine in a different region. Within the JumpBox-Provisioner, Docker is used to manage containers for an Ansible container in  JumpBox-Provisioner. This Ansible container then uses YAML playbooks and configuration files to manage DVWA containers in each Web VM, and the ELK container in ELK-Net.

- Access Policies

  The Web VMs can be accessed via SSH through the Ansible container within JumpBox-Provisioner. The JumpBox-Provisioner is accessible through SSH via a public IP. Web VM web services and ELK-Net web services can be accessed through a browser over HTTP to the Read-Team-LoadBalancer. 

- ELK Configuration
  - Beats in Use: elasticsearch, haproxy, kafka, kibana, nats, osquery, and santa.
  - Machines Being Monitored: Web-1, Web-2, Web-3
  
- How to Use the Ansible Build

  First create configuration files for a given container service, and add the host IP of the VM that will act as a shell for the service to the hosts file. Next, configure the container with a YAML playbook, and then run the YAML playbook.


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly availiable, in addition to restricting access to the network.
- Load balancers protect the availiability aspect of the CIA triad. The advantage of a JumpBox-Provisioner machine is that 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the foiles and system security.
- Filebeat watches for changes to files (or their locations) as previously specified and then forwards them to Elasticsearch and Logstash for indexing.
- Metricbeat records system's CPU usage, memory, file system, disk usage, and network statistics.

The configuration details of each machine may be found below.

| Name                  | Function      | IP Address    | Operating System |
| --------------------- | ------------- | ------------- | ---------------- |
| JumpBox-Provisoner    | Gateway       | 10.0.0.5      | Linux            |
| Red-Team-LoadBalancer | Load Balancer | 104.40.10.164 | -                |
| Web-1                 | Web Server    | 10.0.0.6      | Linux            |
| Web-2                 | Web Server    | 10.0.0.7      | Linux            |
| Web-3                 | Web Server    | 10.0.0.8      | Linux            |
| ELK-Net               | ELK Stack     | 10.1.0.4      | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- This should be your own public IP address. *Sorry - not mentioning mine here!*

Machines within the network can only be accessed by:
- The Ansible Docker container within JumpBox-Provisioner.

A summary of the access policies in place can be found in the table below.

| Name                | Publicly Accessible | Allowed IP Addresses                   |
| ------------------- | ------------------- | -------------------------------------- |
| JumpBox-Provisoner  | Yes                 | 10.0.0.6, 10.0.0.7, 10.0.0.8, 10.1.0.4 |
| Web-1, Web-2, Web-3 | No                  | None                                   |
| ELK-Net             | Yes                 | None                                   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- This would take far too much time to do and you would have to set up new routes, users, software, and manage the Operating System - each new node at a time.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...
- 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


![docker-ps](../Diagrams/docker-ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the YAML playbook files to `roles`, and their associated configuration files to `files`.
- Update the `hosts` file to include the added node's local IP, and the `ansible.cfg` to include a user for the node.
- Run the playbook, and navigate to the new node to check that the installation worked as expected.

### Questions

-  **Question:** Which file is the playbook? Where do you copy it?

  **Answer:** Playbook files should be within the Ansible directory. In this case there are playbooks in the Ansible directory, and in the roles directory. The important thing to note here is that when the playbook is called, the the proper filepath is used.

- **Question:** Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?

  **Answer:** `my-playbook.yml`

- **Question:**   Which URL do you navigate to in order to check that the ELK server is running?

   **Answer:**     `http://<>:5601/app/kibana`


