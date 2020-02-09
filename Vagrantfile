# -*- mode: ruby -*-
# vi: set ft=ruby :

# Common config
$name = "roonserver"
$cpus = 2
$mem = 4096
$gui = false

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1604"
  config.vm.network "public_network"
  config.vm.hostname =  "roonserver"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = $name
    vb.gui = $gui
    vb.memory = $mem
    vb.cpus = $cpus
  end
  
  config.vm.provider "vmware-desktop" do |vm|
    vm.name = $name
    vm.gui = $gui
    vm.vmx["memsize"] = $mem
    vm.vmx["numvcpus"] = $cpus
  end  
  
  config.vm.provider "hyperv" do |h|
    h.vmname = $name
    h.cpus = $cpus
    h.maxmemory = $mem
  end  
  
  config.vm.provision "shell", path: "script.sh"
  
  config.vm.post_up_message = "All Done! RoonServer should be running on your machine now." 

end
