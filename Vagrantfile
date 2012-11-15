# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  
  config.vm.box = "debian6_amd64_simplephp"
  config.vm.box_url = "https://dl.dropbox.com/s/1qr8xv6ytie4bta/debian6_amd64_simplephp.box?dl=1"
  
  config.vm.network :hostonly, "10.10.10.10", :adapter=>4
  config.vm.customize ["modifyvm", :id, "--memory", "512"]

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "vagrant/puppet/manifests"
    puppet.manifest_file  = "base.pp"
  end

  config.vm.provision :shell, :inline => "/bin/bash /vagrant/load_database.sh"


end
