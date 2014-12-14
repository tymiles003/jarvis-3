# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version
Vagrant.configure(2) do |config|
  # Ubuntu Server 14.04 LTS
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = true

  config.vm.define "jarvis" do |jarvis|
    jarvis.vm.hostname = "jarvis"
    jarvis.vm.network "private_network", ip: "33.33.33.3"
    
    jarvis.vm.synced_folder("./data", "/data")
    config.vm.provider "virtualbox" do |vb|
      vb.name = "jarvis"
      vb.cpus = "1"
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end

  end

  # config.vm.provision "shell", path: "setup.sh", keep_color: "true"
end
