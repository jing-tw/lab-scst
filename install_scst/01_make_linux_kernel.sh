#/bin/bash
sudo apt-get update

sudo locale-gen en_US en_US.UTF-8 zh_TW zh_TW.UTF-8
sudo dpkg-reconfigure locales

sudo apt-get -y --force-yes install git

cd ~
git clone https://github.com/gstanden/orabuntu-lxc.git
cd orabuntu-lxc
tar -xvf scst-files.tar

# mount ~/Download on the /dev/sdb1
mkdir ~/Downloads
cd ~/Downloads
DownloadPath=`pwd`

echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdb
sudo mkfs.ext4 /dev/sdb1
sudo mount /dev/sdb1 ${DownloadPath}
sudo chown $(id -u):$(id -g) ${DownloadPath}


# pull scst code
cd ~/orabuntu-lxc/scst-files

. ./create-scst-1a.sh 

 # Create a custom flavor for scst based on the generic flavor
cd ~/orabuntu-lxc/scst-files
. ./create-scst-1b.sh 

# Editing Linux kernel build option: vars.scst, vars.scst, getabis and amd64.mk
cd ~/orabuntu-lxc/scst-files
. ./create-scst-1c.sh 

################
# PATCH
# for Ubuntu 14.04 (Linux kernel: 3.13)
# Add the following code in ~/Downloads/linux-3.13.0/drivers/scst/scst_targ.c
# 
# static inline bool ktime_before(const ktime_t cmp1, const ktime_t cmp2)
# {
#         return ktime_compare(cmp1, cmp2) < 0;
# }
################

cd ~/orabuntu-lxc/scst-files
. ./create-scst-1d.sh 
