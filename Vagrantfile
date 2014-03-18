# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3001, host: 3001
  config.vm.network :forwarded_port, guest: 3500, host: 3500

  config.ssh.forward_agent = true

  config.vm.provision :shell, :path => 'setup_sudo.sh'
  config.vm.provision :shell, :path => 'setup.sh', :privileged => false

  config.vm.synced_folder ".", "/vagrant",
    type: "rsync",
    rsync__auto: "true",
    rsync__exclude: ".git/",
    id: "shared-folder-id"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
end
