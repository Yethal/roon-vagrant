# roon-vagrant
Quickly setup Roon server VM using Vagrant

This Vagrantfiles sets up an Ubuntu VM and then installs Roon Server running as standard user.
Due to the fact that Roon uses IGMP and multicast for endpoint discovery the only sane way to configure networking for the VM is to use bridged networking.

## Supported providers:
* VirtualBox
* Vmware-Desktop
* HyperV

## Usage guide:
* Clone this repository
* Enter the roon-vagrant directory
* Run `vagrant up`
* Select network interface the vm should bind to when prompted
* Launch your Roon client and verify the server is visible and that connections is possible
