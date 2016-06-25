#!/bin/bash

# flush unsed multipath (when the vagrant mount share folder failure by updated guest kernel)
# show  the current multipath topology
sudo multipath -ll

# flush all unused multipath device maps
sudo multipath -F

# check the multipath topology
sudo multipath -ll

# remount sdb1 again to see the Download
cd ~/Downloads
DownloadPath=`pwd`
cd ~
sudo mount /dev/sdb1 ${DownloadPath}
sudo chown $(id -u):$(id -g) ${DownloadPath}


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

# build scst module
cd ~/orabuntu-lxc/scst-files
. ./create-scst-2b.sh

# add module
cd ~/orabuntu-lxc/scst-files
. ./create-scst-3.sh
