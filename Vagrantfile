# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.host_name = "simple-mongo"
  config.vm.synced_folder "apt-cache", "/var/cache/apt/archives", create: true
  # config.vm.boot_mode = :gui
  
  config.vm.provision :shell do |shell|
  shell.inline = "if [ ! -d /etc/puppet/modules ] ; then mkdir -p /etc/puppet/modules;
                  puppet module install puppetlabs/mongodb;
				  fi"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "simple-mongo.pp"
  end
end
