########################################################################
#
# Makefile for generating kernel module for the character driver
#
# commands: (default), clean, install, deinstall.
# run as sudo: install, deinstall
#
# Version: 1.1
#	
# History
# 1.0 - 19700000 - JSC: initial version
# 1.1 - 20170501 - JSC: pr solved on clean; added install, deinstall
#

obj-m += lab1_chrdrv.o


#all:
#	make -C /lib/modules/3.2.0-37-generic/build M=/home/xubuntu/Desktop/DRVO/H2.8 modules

KDIR = /lib/modules/$(shell uname -r)/build
PWD  = $(shell pwd)
MAKE = /usr/bin/make
MOD  = $(shell ls *.ko)
DEV  = /dev/mycdrv

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	

clean:
	rm *.o *.ko *.order \.*.cmd *.symvers *.mod.c 
	rm -R \.[a-zA-Z]*     

# Run as sudo!
install:
	insmod $(MOD)
	mknod $(DEV) c 700 0

# Run as sudo!
deinstall:
	rm $(DEV)
	rmmod $(MOD)

#command definitions in stead of file parsing	
.PHONY: all clean    
    
	
