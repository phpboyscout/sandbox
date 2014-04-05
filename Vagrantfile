# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu64-saucy"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network :private_network, ip: "192.168.56.200"
  config.vm.synced_folder "../", "/home/vagrant/workspace/"
  config.vm.hostname = "sandbox"
  config.vbguest.no_remote = false

  config.vm.provider :virtualbox do |vb|
    vb.name = "Sandbox"
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Enable Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "vagrant-inventory"
    ansible.host_key_checking = "false"
    ansible.limit = 'all'
  end
end
