# Getting Started (ansible-awx-on-vagrant)

Install and configure Ansible AWX on local Vagrant machines. The Ansible roles from geerlingguy are used for the main tasks.

## Run in Vagrant

The below steps are needed to get everything setup.

    # [Optional] download the required roles again if they are not there
    ansible-galaxy install -r requirements.yml
    pip install -r requirements.txt
    # [Optional] destroy the existing machines
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

Log in to the machine and check the docker logs:

```bash
$ vagrant ssh awx

# Tail the the awx_task log
$ sudo docker logs -f awx_task
```

## How it Works

### Creating Ansible AWX in Vagrant

Add the awx machine name and IP address to the `Vagrant` file as shown below:

    machines = {
    'awx' => '10.10.10.10',
    'node01' => '10.1.1.1',
    'node10' => '10.1.1.10'
    }

### Vagrant Plugins

Install the [`vagrant-hosts-provisioner`](https://github.com/mohatt/vagrant-hosts-provisioner) to manage the hosts file on your local machine.

    $ vagrant plugin install vagrant-hosts-provisioner

A useful plugin if you are using a proxy server is [`vagrant-proxyconf`](http://tmatilai.github.io/vagrant-proxyconf/)

    $ vagrant plugin install vagrant-proxyconf

### Vagrant ssh config

In order to ssh into the running vms from our terminal:

- Use vagrant ssh: `vagrant ssh node01`

- Use ssh with the user set to vagrant and with strict host checking disabled:

        ssh -i .vagrant/machines/node01/virtualbox/private_key vagrant@127.0.0.1 -p $(vagrant port node01 --guest 22) -o StrictHostKeyChecking=no

- Generate an ssh config file from Vagrant and use it:

```bash
    # save the ssh config file that is generated from Vagrant locally
    vagrant ssh-config > ~/.ssh/vagrant-ssh-config

    # run ssh with the generated config file to log into the vm
    ssh -F ~/.ssh/vagrant-ssh-config node01
```

### Ansible ssh config

We need to allow ansible to ssh into the Vagrant machines as well.

- We can add `ssh_args` in the [ssh_connection] of the ansible.cfg file:

    [ssh_connection]
    ssh_args = -F ./files/vagrant-ssh-config

- If running from command line, then we need to add the `ansible_ssh_common_args` parameter:

    $ ansible-playbook -i environments/test -e "ansible_user='vagrant' ansible_ssh_common_args='-F ./files/vagrant-ssh-config'" -v install_awx.yml

### What's Inside the Vault?

The vault contains the default password (password) for the awx admin user (admin). In order to decrypt the vault, create a `vault_password_test` file in the main directory with the following content (the vault password in this case):

    aVeryStrongVaultPasswordGoesHere!


## Manual Installation Steps

This what we usually have to do on a host by hand to get AWX up and running:

    # enable extras repo
    yum -y install epel-release --enablerepo=extras
    yum -y install \
        python-pip \
        git

    # install docker
    yum -y install docker

    # enable docker on startup
    systemctl start docker
    systemctl enable docker

    # install Ansible AWX prerequisites
    pip install --upgrade pip
    pip install docker \
        docker-compose \
        ansible

    # clone and install AWX
    git clone https://github.com/ansible/awx.git
    cd /home/vagrant/awx/installer
    ansible-playbook -i inventory install.yml
