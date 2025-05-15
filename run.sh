#!/bin/sh

ansible-playbook -i inventory/development -e "ansible_user=$(whoami)" main.yml
