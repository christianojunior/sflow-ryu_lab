Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox"
  config.vm.box = "bento/ubuntu-20.04"
  config.vm.box_version = "202012.23.0"
  config.vm.hostname = "mininetlab"
  config.vm.network "public_network"
  config.vm.define "mininet-lab"

  config.vm.provider "virtualbox" do |v|

    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
    v.customize ["modifyvm", :id, "--name", "mininet_lab"]
    v.customize ["modifyvm", :id, "--nestedpaging", "on"]

  end
  config.vm.provision "file", source: "files\\scripts\\sflow.py", destination: "/home/vagrant/working_directory/"  
  config.vm.provision "shell", path: "files\\scripts\\script.sh"

end
