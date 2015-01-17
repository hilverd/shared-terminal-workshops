# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME = ENV["BOX_NAME"] || "trusty"
BOX_URI  = ENV["BOX_URI"] || "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

Vagrant::configure("2") do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URI

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh"

  $install_puppet_modules = <<SCRIPT
  puppet module list | grep -q puppetlabs-apt || puppet module install puppetlabs/apt
  puppet module list | grep -q garethr-docker || puppet module install garethr/docker
SCRIPT

  config.vm.provision "shell", inline: $install_puppet_modules

  config.vm.provision "shell", inline: "rm -rf /var/tmux"

  config.vm.provision :puppet do |puppet|
    # Useful debugging options:
    # puppet.options = "--verbose --debug --trace"
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end

  config.vm.provision "shell", inline: "sudo /home/vagrant/remove-all-docker-containers.sh"

  config.vm.provision "shell", inline: "sudo make -C /home/vagrant/exercises-sandbox build"
end
