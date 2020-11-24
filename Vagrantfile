#
# Creamos el fichero vagrantfile con la version de ubuntu
Vagrant.configure("2") do |config|
  config.vm.define :nodo1 do |nodo1|
    nodo1.vm.box = "ubuntu/trusty64"
    nodo1.vm.hostname = "nodo1"
# Configuramos la maquina virtual con 2GB de espacio y la opción gui para que se ha con parametros que hemos indicado
    nodo1.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.memory = "2048"
    end
    
# Creamos y provisionamos el script provision.sh para instalar lamp y adminer
    nodo1.vm.provision "shell", path: "provision.sh"
  end
end
