#!/bin/bash

# create a template file
cd ~/Downloads
sudo dd if=/dev/zero of=disk01 bs=1M count=100

# Setup scst configuration file
DISK_FILE_PATH=`pwd`

echo "
HANDLER vdisk_fileio {
        DEVICE disk01 {
                filename $DISK_FILE_PATH/disk01
                nv_cache 1
        }
 }

 TARGET_DRIVER iscsi {
        enabled 1
        TARGET iqn.2016-05.iscsi.lan:tgt{
                LUN 0 disk01
                enabled 1
        }
 }
" | sudo tee /etc/scst.conf


sudo /etc/init.d/scst restart #sudo service scst start
sudo modprobe scst
sudo modprobe scst_vdisk
sudo modprobe iscsi-scst

# load scst configuration
sudo iscsi-scstd
sudo scstadmin -config /etc/scst.conf

# check
sudo scstadmin -list_device
