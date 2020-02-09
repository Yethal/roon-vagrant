#!/bin/sh
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