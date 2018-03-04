# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "Ubuntu-16-DevOps"
  config.vm.box = "bento/ubuntu-16.04"

  config.vbguest.auto_update = false

  config.vm.network "forwarded_port", guest: 8080, host: 8090
  config.vm.provider "virtualbox" do |vb|
     vb.name = "vagrant-devops"
     vb.memory = "2048"
  end

  config.vm.provision "shell", path: "provision/provision.sh"
    
end