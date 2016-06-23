#/bin/bash

sudo apt-get update

sudo locale-gen en_US en_US.UTF-8 zh_TW zh_TW.UTF-8
sudo dpkg-reconfigure locales

cd ~
git clone https://github.com/gstanden/orabuntu-lxc.git
cd orabuntu-lxc
tar -xvf scst-files.tar
mkdir ~/Downloads

# pull scst code
cd ~/orabuntu-lxc/scst-files
. ./create-scst-1a.sh

 # Create a custom flavor for scst based on the generic flavor
cd ~/orabuntu-lxc/scst-files
. ./create-scst-1b.sh

# Editing Linux kernel build option: vars.scst, vars.scst, getabis and amd64.mk
cd ~/orabuntu-lxc/scst-files
. ./create-scst-1c.sh
cd ~/orabuntu-lxc/scst-files
. ./create-scst-1d.sh
