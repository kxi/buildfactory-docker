VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "docker-host" do |dockerhost|
    dockerhost.vm.box = "ubuntu/trusty64"
    dockerhost.ssh.forward_agent = true
    dockerhost.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
    end
   
    dockerhost.vm.provision "shell", path: "provision/install_script.sh"
    dockerhost.vm.network "forwarded_port", guest: 80, host: 2080
    dockerhost.vm.network "private_network", ip: "192.168.50.5"
  end
end
