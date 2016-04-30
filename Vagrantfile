VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "docker-build-factory" do |dockerhost|
    dockerhost.vm.box = "ubuntu/trusty64"
    dockerhost.ssh.forward_agent = true
    dockerhost.vm.provider "virtualbox" do |vb|
      vb.name = "docker-build-factory"
      vb.memory = 512
      vb.cpus = 1
    end
   
    dockerhost.vm.provision "shell", path: "provision/install_script.sh"
    dockerhost.vm.network "forwarded_port", guest: 1080, host: 1080
    dockerhost.vm.network "private_network", ip: "192.168.50.5"
  end
end

