# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
VAGRANT_OS = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
VAGRANT_SYNC_FOLDER = "../"
VAGRANT_HOSTNAME = "sandbox"
VAGRANT_MEMORY = "2048"

PHP_IP = "192.168.56.200"
JAVA_IP = "192.168.56.201"
NODEJS_IP = "192.168.56.202"
PYTHON_IP = "192.168.56.203"
RUBY_IP = "192.168.56.204"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu64-trusty"
    config.vm.box_url = VAGRANT_OS
    config.vm.synced_folder VAGRANT_SYNC_FOLDER, "/home/vagrant/workspace/"
    config.vm.hostname = VAGRANT_HOSTNAME
    config.vbguest.no_remote = false

    config.vm.provider :virtualbox do |vb|
        vb.name = "Sandbox"
        vb.gui = false
        vb.customize ["modifyvm", :id, "--memory", VAGRANT_MEMORY]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    config.vm.define "php" do |php|
        php.vm.box = "php"
        php.vm.network :private_network, ip: PHP_IP

        php.vm.provider :virtualbox do |vb|
            vb.name = "Sandbox-PHP"
        end

        php.vm.provision "ansible" do |ansible|
            ansible.verbose = "v"
            ansible.playbook = "provisioning/playbook-php.yml"
            ansible.inventory_path = "vagrant-inventory"
            ansible.host_key_checking = false
            ansible.limit = "php"
        end
    end

    config.vm.define "nodejs" do |nodejs|
        nodejs.vm.box = "nodejs"
        nodejs.vm.network :private_network, ip: PHP_IP

        nodejs.vm.provider :virtualbox do |vb|
            vb.name = "Sandbox-NodeJS"
        end

        nodejs.vm.provision "ansible" do |ansible|
            ansible.verbose = "v"
            ansible.playbook = "provisioning/playbook-nodejs.yml"
            ansible.inventory_path = "vagrant-inventory"
            ansible.host_key_checking = false
            ansible.limit = "nodejs"
        end

    end
    config.vm.define "java" do |java|
        java.vm.box = "java"
        java.vm.network :private_network, ip: JAVA_IP

        java.vm.provider :virtualbox do |vb|
            vb.name = "Sandbox-Java"
        end

        java.vm.provision "ansible" do |ansible|
            ansible.verbose = "v"
            ansible.playbook = "provisioning/playbook-java.yml"
            ansible.inventory_path = "vagrant-inventory"
            ansible.host_key_checking = false
            ansible.limit = "java"
        end
    end

    config.vm.define "python" do |python|
        python.vm.box = "python"
        python.vm.network :private_network, ip: PYTHON_IP

        python.vm.provider :virtualbox do |vb|
            vb.name = "Sandbox-Python"
        end

        python.vm.provision "ansible" do |ansible|
            ansible.verbose = "v"
            ansible.playbook = "provisioning/playbook-python.yml"
            ansible.inventory_path = "vagrant-inventory"
            ansible.host_key_checking = false
            ansible.limit = "python"
        end
    end

    config.vm.define "ruby" do |ruby|
        ruby.vm.box = "python"
        ruby.vm.network :private_network, ip: PYTHON_IP

        ruby.vm.provider :virtualbox do |vb|
            vb.name = "Sandbox-Ruby"
        end

        ruby.vm.provision "ansible" do |ansible|
            ansible.verbose = "v"
            ansible.playbook = "provisioning/playbook-ruby.yml"
            ansible.inventory_path = "vagrant-inventory"
            ansible.host_key_checking = false
            ansible.limit = "ruby"
        end
    end
end
