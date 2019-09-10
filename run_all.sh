 #!/bin/bash

# Install requirements
ansible-galaxy install -r requirements.yml
pip install -r requirements.txt
# Destroy previous VMs
vagrant destroy -f
# Create the machines
vagrant up
# Generate and the ssh config file
vagrant ssh-config > ./files/vagrant-ssh-config
# Create the awx user on the tower host and generate a new ssh key
ansible-playbook create_awx_user_tower.yml -v
# Create the awx user and distribute the previously generated public key to the nodes
ansible-playbook create_awx_user_nodes.yml -v
# Install awx on the tower host
ansible-playbook install_awx.yml -v
# wait until awx is up and running
sleep 41
# Create sample tower projects
ansible-playbook create_tower_project.yml -v
