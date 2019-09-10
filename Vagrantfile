# -*- mode: ruby -*-
# vi: set ft=ruby :
# rubocop:disable UnneededDisable, LineLength, BlockLength

box_image = 'centos/7'
box_check_update = false

host_cpus = 1
host_ram = 1024

machines = {
  'awx' => '10.10.10.10',
  'node01' => '10.1.1.1',
  'node10' => '10.1.1.10'
}

Vagrant.require_version '>= 2.2.0'

# vagrant-hostsupdater plugin is required to manage the hosts in /etc/hosts
unless Vagrant.has_plugin?("vagrant-hostsupdater")
  raise 'vagrant-hostsupdater plugin is not installed!'
end

Vagrant.configure('2') do |config|

  # configure VMs
  machines.each do |host_name, ip|
    config.vm.define host_name do |machine|
      vm = machine.vm
      # Allow accessing port 80, 443 on the guest via port 10080, 10433 on the host for the awx machine only
      if host_name == 'awx'
        vm.network "forwarded_port", guest: 80, host: 10080
        vm.network "forwarded_port", guest: 443, host: 10443
      end
      vm.box = box_image
      vm.box_check_update = box_check_update
      vm.hostname = host_name
      vm.network 'private_network', ip: ip
      vm.provider 'virtualbox' do |vb|
        vb.customize ['modifyvm', :id, '--cpus', host_cpus]
        vb.customize ['modifyvm', :id, '--memory', host_ram]
      end
    end
  end
  config.vm.provision 'shell', inline: <<-SHELL
    echo 'provisioning done..'
  SHELL
end
