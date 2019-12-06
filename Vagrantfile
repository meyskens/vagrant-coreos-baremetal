# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

NUM_CONTROLLERS = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "provisioner" do |provisioner|
    hostname = "provisioner-1.infra.box.srcd.local"
    provisioner.vm.box = "ubuntu/bionic64"
    provisioner.vm.hostname = hostname
    provisioner.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

    provisioner.vm.network "private_network", ip: "192.168.1.1", virtualbox__intnet: "pxe_network"

    provisioner.vm.provision "shell",
      inline: "sudo apt-get update"

    provisioner.vm.provision "shell",
      inline: "sudo apt-get install -y python-netaddr"

    provisioner.vm.provision "ansible_local" do |ansible|
        ansible.become = true
        ansible.extra_vars = {
          internal_ip: "192.168.1.1",
          dhcp_range: "192.168.1.2,192.168.1.255",
          terraform_version: "0.11.14",
          num_controllers: NUM_CONTROLLERS,
        }

        ansible.playbook = "./ansible/provisioner.yml"
    end
    provisioner.vm.provision "shell", privileged: true,
      inline: "cd /vagrant/terraform/environments/box/ && terraform init && terraform apply -auto-approve"
    
    (1..NUM_CONTROLLERS).each do |i|
      provisioner.vm.network "forwarded_port", guest: 2210+i, host: 2210+i
    end
  end

  (1..NUM_CONTROLLERS).each do |i|
    config.vm.define "controller-#{i}" do |node|
      node.vm.box = "pxe-boot-3-disk-coreosdisk.box"
      node.vm.hostname = nil
      node.vm.synced_folder '.', '/vagrant', disabled: true
      node.vm.network "private_network", type: "dhcp", virtualbox__intnet: "pxe_network", auto_config: false
      
      node.ssh.port = 2210+i
      node.ssh.password = "vagrant"
      node.ssh.keys_only = false

      node.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 1
        v.customize [
          'modifyvm', :id,
          '--nic1', 'intnet',
          '--intnet1', 'pxe_network',
          '--nicbootprio1', '1',
          '--macaddress1', "08002700000#{i}",
          '--nic2', 'none',
          '--boot1', 'net',
          '--boot2', 'none',
          '--boot3', 'none',
          '--boot4', 'none'
        ]
      end
    end
  end

end
