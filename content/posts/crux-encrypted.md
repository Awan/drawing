---
layout: post
author: Abdullah Khabir
tags:
- encrypted crux
- encryption
- luks
- lvm
- encrypted laptop
- source based distros
- crux
description: "Encrypted CRUX installation"
title: "How to install CRUX with encryption"
toc: true
comments: true
date: 2020-05-12
url: encrypted-crux
keywords: ["crux", "crux encryption install", "how to install crux", "crux with encryption"]
---


## How to install fully encrypted CRUX
This post is for crux users who wanna secure their crux installation.

## Partitioning
I'm gonna use two partitions. First boot partition will be unencrypted which holds kernel. I use secure boot with my own keys. You can find a post in my blog how to do that. and I have some ports too for secure boot. </p>



## Unencrypted Boot Partition



Create a partition more than 200 Mbs for boot ESP with gdisk code ef00.

Let's create a FAT filesystem on it for EFI.

```

```bash

# mkfs.fat -F32 /dev/sda1

```

## Encrypted Partition

Create an encrypted LUKS container

```bash
# cryptsetup luksFormat /dev/sda2

```

Type uppercase "YES" and then enter passphrase two times.

Open the encrypted container.

```bash
# cryptsetup open /dev/sda2 crux
```

Now the encrypted container is available at /dev/mapper/crux so lets create some lvm stuff and create filesystems and a swap partition.

```bash
# pvcreate /dev/mapper/crux
# vgcreate ak /dev/mapper/crux
# lvcreate -L 8G ak -n swap
# lvcreate -L 50G ak -n root
# lvcreate -l 100%FREE ak -n home
# mkfs.ext4 /dev/ak/root -L crux-root
# mkfs.ext4 /dev/ak/home -L crux-home
# mkswap /dev/ak/swap -L crux-swap

```

Mount the partitions and start installations.

```bash
# mount /dev/mapper/ak-root /mnt
# mkdir /mnt/{boot,home}
# mount /dev/mapper/ak-home /mnt/home
# mount /dev/sda1 /mnt/boot
# swapon /dev/mapper/ak-swap
```

## Base system installation

Start installation. Type "setup" and select "YES". Install all packages. Make sure you get no error messages once installation is finished.

```bash
# setup

```

## Chroot

Enter chroot.

```bash

# setup-chroot

```

## fstab

Check fstab by going to /etc/fstab. Open it with vim. You'll see two uncommented entries there. Leave them as it is. In vim prompt mode just type :r! blkid and you'll get UUIDs of all partitions. Add them there for root, home, boot and swap partitions.

## locales

Generate locales.

```bash
# localedef -i en_US -f ISO-8859-1 en_US
# localedef -i en_US -f ISO-8859-1 en_US.ISO-8859-1
# localedef -i en_US -f UTF-8 en_US.UTF-8
```

## rc.conf

Edit rc.conf. Mine looks like this.

```bash
# vim /etc/rc.conf

#
# /etc/rc.conf: system configuration
#

FONT=ter-v22n
KEYMAP=us
TIMEZONE=Asia/Karachi
HOSTNAME=cruz
SYSLOG=sysklogd
SERVICES=(crond wifi acpid )

# End of file

:wq
```

## resolv.conf

Edit /etc/resolv.conf. I'm using OpenDNS nameserver here.

```bash
# vim /etc/resolv.conf

nameserver 208.67.222.222

:wq
```

## wifi

For wireless connection, you can use wpa\_supplicant. For example if your interface is wlp3s0 and SSID is nix, add passphrase to it using wpa\_passphrase like this.

```bash
# wpa_passphrase nix >> /etc/wpa_supplicant.conf
Reading from STDIN  # Type your passphrase.

# wpa_supplicant -i wlp3s0 -B -c /etc/wpa_supplicant.conf
# dhcpcd wlp3s0

```

## Kernel

Compile the kernel now. Go to the /usr/src/linux directory. Configure the kernel config. Since we are gonna have an encrypted installation, we need some extra drivers. Invoke 'make menuconfig' and enable these options. And also enable what is needed for your hardware. I'll add only options needed for encryption here.


```bash

General setup --->

  [*] Initial RAM filesystem and RAM disk (iniramfs/initrd) support


Device Drivers --->

  Multiple devices driver support (RAID and LVM) --->
    [*] Device mapper support
    [*] Crypt target support

Cryptographic API --->

  -*- CBC support
  <*> SHA224 and SHA256 digest algorithm
  <*> AES cipher algorithms

```


You can get my kernel config from https://gitlab.com/Abdullah/cfg/raw/master/kernel/config by using wget and then edit it as per your hardware. This one is for Thinkpad with SSD.


```bash
# wget https://gitlab.com/Abdullah/cfg/raw/master/kernel/config > .config

```

After you're done with configuring kernel, compile it. Once it's compiled, copy it to /boot directory and install modules.


```bash
# make -j8
# make modules_install
# cp arch/x86/boot/bzImage /boot/vmlinuz
# cp System.map /boot
```

## Users and package management

## Root password and a normal user

Set root password. Create our first user. And then we will create a second user for package management.

```bash
# passwd
# useradd -G wheel,audio,video -m -U abdullah
# passwd abdullah
```

## Give new user sudo access

Add new created user to sudoers. Uncomment this line in /etc/sudoers.


```bash
%wheel ALL=(ALL) ALL
```

## User for creating packages

Now let's create a user for package management.

```bash
# groupadd pkgmk
# useradd -m -g pkgmk pkgmk

```

Add our user to this newly created group.

```bash
# usermod -aG pkgmk abdullah

```

## fakeroot

Edit /etc/prt-get.conf to set up fakeroot building.

```bash
# makecommand sudo -H -u pkgmk /usr/bin/fakeroot /usr/bin/pkgmk

```

Edit /etc/pkgmk.conf.

```bash
# vim /etc/pkgmk.conf

PKGMK_SOURCE_DIR="/home/pkgmk/distfiles"
PKGMK_PACKAGE_DIR="/home/pkgmk/packages"
PKGMK_WORK_DIR="/home/pkgmk/work/$name"

:wq
```

Create those directories.

```bash
# mkdir /home/pkgmk/{distfiles,packages,work}
# chown pkgmk:pkgmk /home/pkgmk/*
# chmod 775 /home/pkgmk/*

```

Enable contrib repository.


```bash

# mv /etc/ports/contrib.rsync.inactive /etc/ports/contrib.rsync

```

Add my custom ports repository.

```bash

# echo "ROOT_DIR=/usr/ports/ak\nURL=https://abdullah.today/ports" > /etc/ports/ak.httpup


```

Enable contrib and my repository by editing /etc/prt-get.conf. Uncomment the line which says "prtdir /usr/ports/contrib" and add this line on top of the other port directories path. "prtdir /usr/ports/ak". Also don't forget to uncomment the line which says, "runscripts yes". After editing the file, it should be look like this.


```bash

###
### prt-get conf
###

# note: the order matters: the package found first is used
prtdir /usr/ports/ak
prtdir /usr/ports/core
prtdir /usr/ports/opt
prtdir /usr/ports/xorg

# the following line enables the multilib compat-32 collection
#prtdir /usr/ports/compat-32

# the following line enables the user maintained contrib collection
prtdir /usr/ports/contrib

### use mypackage form local directory
# prtdir /home/packages/build:mypackage

### log options:
# writelog enabled         # (enabled|disabled)
# logmode  overwrite       # (append|overwrite)
# rmlog_on_success yes     # (no|yes)
logfile  /var/log/pkgbuild/%n.log
                           # path, %p=path to port dir, %n=port name
                           #       %v=version, %r=release

### use alternate cache file (default: /var/lib/pkg/prt-get.cache
# cachefile /mnt/nfs/cache

### print README information:
# readme verbose           # (verbose|compact|disabled)

### prefer higher versions in sysup / diff
# preferhigher no      # (yes|no)

### use regexp search
# useregex no        # (yes|no)

### run pre- and post-installs scripts; yes is equivalent to the
### --install-scripts option
runscripts yes            # (no|yes)


### EXPERT SECTION ###

### alternative commands
# makecommand      pkgmk
# addcommand       pkgadd
# removecommand    pkgrm
# runscriptcommand sh
makecommand sudo -H -u pkgmk /usr/bin/fakeroot /usr/bin/pkgmk

```

Sync ports now.

```bash

# ports -u

```


Get fakeroot installed if you don't have yet.

```bash

# prt-get install fakeroot

```



## Dracut

Get dracut and create an initramfs.

```bash
# prt-get depinst dracut
# dracut initramfs.img

```

## Bootloader

I'm using EFISTUB. If you're using some other boot manager like grub, consult their wiki. There are some dracut related variables in this example. I'd recommand, create a new file with vim, and then in prompt mode, type :r! blkid so you'll get all UUIDs there in the file. Just copy them in the new file, delete other lines and save it. Then redirect this file's output to shell like this, 'cat newCreatedFile | sh'. It will create a new entry. root-UUID=, rd.luks.uuid=, and rd.lvm.vg=. For EFISTUB, create an entry like this.

```bash
# efibootmgr --create --disk /dev/sda --part 1 --label 'CRUX-Encrypted' --loader /vmlinuz --unicode "root=UUID=XXXX-XXXX-XXXX-XXX rw resume=UUID=XXXX-XXXX-XXXX-XXXX rd.luks.uuid=XXXX-XXXX-XXXX-XXXX rd.lvm.vg=ak" --verbose

```

## Congrats!

Congrats! You have now a fully encrypted system. Reboot now. If you have some problems, just send me an email and I'll be glad to help.
