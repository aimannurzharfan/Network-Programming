# Network + System Automation Toolkit

This project automates a small network and system administration workflow.
Ansible playbooks configure a Cisco CSR1000v router and save the resulting
configurations, a Bash script collects Linux system information, and a Python
web app running in Docker displays everything in one page.

## Folder Structure

    ansible/    - Ansible playbooks, hosts inventory, and ansible.cfg
    scripts/    - Bash system-info script (sysinfo.sh)
    webapp/     - Flask web app and build.sh

## How to Run

1. Clone the repo.

2. In `ansible/hosts`, set `ansible_host` to your own CSR1000v IP
   (192.168.56.101 or 192.168.56.102).

3. From inside `ansible/`, run the playbooks:

       ansible-playbook configure_interface.yaml -i hosts
       ansible-playbook configure_csr.yaml -i hosts
       ansible-playbook configure_static_route.yaml -i hosts

4. Build and run the web app:

       cd webapp
       bash build.sh

5. Open http://localhost:8080 to view the system info and saved device configs.

## Notes

The playbooks save their outputs in `ansible/ios_configurations/` and the web
app reads them from there.
