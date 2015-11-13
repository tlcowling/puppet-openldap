# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  2.times do |machine|
    config.vm.define "node#{machine}" do |m|
      m.vm.box   = "puppetlabs/centos-6.6-64-puppet"
      m.vm.network "private_network", ip: "192.168.33.#{10 + machine}"
      m.vm.hostname = "node#{machine}.tom.local"
      m.vm.provision "puppet" do |c|
        c.module_path    = "modules"
        c.manifests_path = "."
        c.manifest_file  = "test.pp"
        c.hiera_config_path = "hiera.yaml"
        c.options           = "--parser=future"
      end
    end
  end
end
