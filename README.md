# Network + System Automation Toolkit

This project has three parts. The first part uses Ansible to configure a Cisco
CSR1000v router: setting up an IP address, creating a user account, setting a
banner, adding an interface description, configuring a static route, and
retrieving device information. The second part is a Bash script that collects
Linux system information including hostname, date and time, CPU and memory usage,
disk usage, logged-in users, and the top 5 processes by CPU. The third part is a
Python web application running inside a Docker container that displays the
collected system information and the saved Ansible configuration outputs.

## Folder Structure

    ansible/    - Ansible playbooks, inventory file, and ansible.cfg
    scripts/    - Bash system-info script
    webapp/     - Python web app and Dockerfile

## How to Run

### Ansible Playbooks

Make sure Ansible is installed and the CSR1000v is reachable.

    cd ansible/
    ansible-playbook -i hosts <playbook-name>.yml

### Bash System-Info Script

    cd scripts/
    bash system_info.sh

### Web App (Docker)

    cd webapp/
    docker build -t webapp .
    docker run -p 5000:5000 webapp

Then open a browser at http://localhost:5000
