Vagrant.configure("2") do |config|
  config.vm.define :nodo1 do |nodo1|
    nodo1.vm.box = "ubuntu/trusty64"
    nodo1.vm.hostname = "nodo1"
    nodo1.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.memory = "2048"
    end
    nodo1.vm.provision "shell", path: "provision.sh"
  end
end
