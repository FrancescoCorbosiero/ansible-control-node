#!/bin/bash
ansible-playbook -i /ansible/inventory/inventory.ini "$@"
if [ $? -ne 0 ]; then
    echo "Ansible playbook execution failed."
    exit 1
fi
echo "Ansible playbook executed successfully."