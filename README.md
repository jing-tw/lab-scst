# lab-scst

````bash
[host] vagrant up
[host] vagrant ssh
[vm] cp -fr /vagrant_data/install_scst ~/install_scst
[vm] . ./01_make_linux_kernel.sh
[vm] . ./02_boot_from_new_kernel.sh
[vm] . ./03_make_scst_and_add_module.sh
[vm] . ./04_auto_target_setup.sh
````

To see How to Setup Windows/Linux Initiator, see https://docs.google.com/document/d/1msYFCOGlWN6l_anR4tqOcE0I0ewTaXG1ESUL34vhH0w/edit?usp=sharing.
