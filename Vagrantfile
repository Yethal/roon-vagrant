# -*- mode: ruby -*-
# vi: set ft=ruby :

# Common config
$name = "roonserver"
$cpus = 2
$mem = 4096
$gui = false

$script = <<-'SCRIPT'
user=$(logname)
script=roonserver-installer-linuxx64.sh
apt update -y
apt upgrade -y
apt install -y cifs-utils ffmpeg libasound2
ulimit -n 8192
curl -Ss -O http://download.roonlabs.com/builds/$script
sed -i "s/User=root/User=$user/g" $script
usermod -a -G audio $user
mkdir /var/roon
chown -R $user:$user /var/roon
chown -R $user:$user /mnt
chmod +x $script
yes|bash $script
rm $script
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1604"
  config.vm.network "public_network"
  config.vm.hostname =  $name

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

  config.vm.provision "shell", inline: $script

  config.vm.post_up_message = "
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%*       %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%.           %%% *%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%              %%% *%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%                %%% *%%%%%  %%%%%%%%%%%%%%%
%%%%%%%%%%%%#                 %%% *%%%%%  %%%%%%%%%%%%%%&
%%%%%%%%%%%%                  %%% *%. %%  %%%%%%%%%%%%&&&
%%%%%%%%%%%                   %%% *%. %%  %%%%%%%%%%&&&&&
%%%%%%%%%%%                   %%% *%. %%  %%  %%%&&&&&&&&
%%%%%%%%%%%                   %%% *%. %%  %%##%&&&&&&&&&&
%%%%%%%%%%%%                  %%% *%. %%  %%&%&&&&&&&&&&&
%%%%%%%%%%%%(                 %%% *%%&%%  &&&&&&&&&&&&&&&
%%%%%%%%%%%%%%                %%% *%%%%%  &&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%#              %%% *%&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%            %%% *&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%        %%&&&&&&&&&&&&&&&&&&&&&&&&&
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&
  %%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    %%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        %%%%&%%%%%%%%%&%&&&&&&&&&&&&&&&&&&&&&&&&&
  "

end
