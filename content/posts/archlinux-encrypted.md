---
author: Abdullah Khabir
layout: post
title: 'Encrypted Arch Linux installation'
url: encrypted-archlinux
comments: true
date: 2020-01-03
toc: true
description: 'Encrypted Arch Linux installation'
tags:
  - archlinux
  - encryption
  - encrypted install
  - luks
  - lvm
  - luks_on_lvm
keywords: [ "arch linux encrypted install uefi", "arch linux full disk encryption", "linux encrypted boot", "dm crypt vs luks", "cryptsetup", "arch linux luks", "arch linux install internet connection", "arch linux install uefi", "grub luks2", "luks vs dm-crypt", "grub cryptomount", "sd-encrypt", "luks performance", "luks vs veracrypt", "arch encrypt home", "manjaro architect fsck hook", "should i encrypt boot", "luks1 vs luks2", "manjaro encrypt system", "linux encryption at rest", "luks vs luks2", "arch keyfile", "arch install", "dm-crypt", "lvm", "arch linux install uefi", "luks aes", "linux full disk encryption", "install grub arch", "lvm on luks vs luks on lvm", "arch linux lvm uefi", "zen installer luks", "grub luks2", "luks vs dm-crypt", "grub cryptomount", "sd-encrypt", "luks performance", "luks vs veracrypt", "arch encrypt home", "manjaro architect fsck hook", "should i encrypt boot", "luks1 vs luks2", "manjaro encrypt system", "linux encryption at rest", "luks vs luks2", "arch keyfile", "arch install", "dm-crypt", "lvm", "arch linux install uefi", "luks aes", "linux full disk encryption", "install grub arch", "lvm on luks vs luks on lvm", "arch linux lvm uefi", "zen installer luks"]
---

# What's **Arch Linux**?

![Arch Linux](/images/arch.jpg)

[Arch Linux](https://archlinux.org) is a free
and open source linux distribution based on the rule Keep it Simple.

### Installation
Arch Linux has no graphical installer. You have to install using CLI.

### Installation media creation

Go to [Downloads page](https://archlinux.org/download) and select a nearby mirror. Download the iso file. If you're on Windows, you can use rufus to create a bootable media. 

On linux, you can use **dd**:

```bash
dd if=downloaded iso file of=/dev/sdX status=progress
```

where X is your USB device's ID. Don't use a single partition. Use the whole
device.

### Boot the media

Insert the USB device and reboot the computer. Press the button configured to
come boot options up. Choose your USB device from boot options.

### Connect to internet

If you have ethernet, Arch linux iso will detect it. If you have a wireless
connection, you have to connect it manually.

```bash
wpa_passphrase 'wifi APN' 'wifi password' >> /etc/wpa_supplicant/wpa_supplicant.conf
wpa_supplicant -Bc /etc/wpa_supplicant/wpa_supplicant.conf -i 'wifi interface'
dhclient
```

where wifi APN is the access point name you get when you scan for your wifi. And
wifi interface you can get using iwconfig. It might be wlp3s0 or wlan0.
Or you can use wifi-menu.

Now ping some website **abdullah.today** to check if you're connected to
internet or not.

### Partitioning

There are multiple ways to encrypt the installation. One of them in LUKS on lvm.
It's straightforward. 

Assuming you have a UEFI system and sda is your drive where you wanna install
archlinux.

```bash
gdisk /dev/sda
```

```bash
GPT fdisk (gdisk) version 1.0.1

  Partition table scan:
  MBR: protective
  BSD: not present
  APM: not present
  GPT: present

Found valid GPT with protective MBR; using GPT.

Command (? for help): o
This option deletes all partitions and creates a new protective MBR.
Proceed? (Y/N): Y

Command (? for help): n
Partition number (1-128, default 1): 
First sector (34-242187466, default = 2048) or {+-}size{KMGTP}: 
Last sector (2048-242187466, default = 242187466) or {+-}size{KMGTP}:
+512M
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): EF00
Changed type of partition to 'EFI System'

Command (? for help): n
Partition number (2-128, default 2): 
First sector (34-242187466, default = 1050624) or {+-}size{KMGTP}: 
Last sector (1050624-242187466, default = 242187466) or {+-}size{KMGTP}: 
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 8309
Changed type of partition to 'Linux LUKS'

Command (? for help): p
Disk /dev/sda: 242187500 sectors, 115.5 GiB
Logical sector size: 512 bytes
Disk identifier (GUID): 569FFB67-6969-49E4-B999-15A681987564
Partition table holds up to 128 entries
First usable sector is 34, last usable sector is 242187466
Partitions will be aligned on 2048-sector boundaries
Total free space is 2014 sectors (1007.0 KiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048         1050623   512.0 MiB   EF00  EFI System
   2         1050624       242187466   115.0 GiB   8309  Linux LUKS

command (? for help): w

```

Type o and then Y.

Type n to create a new partition. Select 1 to create a very first partition for
EFI. Hit enter and then type +512M to create a 512 Mbs partition. Enter ef00 as
partition type.

Again type n to create a new partition. Select 2. Hit enter and again enter to
give it rest of the storage if you don't wanna install some other operating
system. Hex code for LUKS is 8309 but you can go without it. By default it will
be 8300 (linux filesystem).

Type p to check if everything is fine. And once satisfied, type w and hit enter
to save the work.


### Create file systems

First, create a filesystem for EFI.

```bash
mkfs.vfat -F32 /dev/sda1
```

Now create a LUKS container.

```bash
 cryptsetup luksFormat /dev/sda2
```

It will ask you to confirm. Type YES in all uppercase. Then choose a good
passphrase. Write it if you can't memorize it. Once forgotten, you can't recover
it.

Now open the new container.

```bash
 cryptsetup open /dev/sda2 cryptlvm
```

Create a physical volume in this LUKS container.

```bash
 pvcreate /dev/mapper/cryptlvm
```

Create a volume group. I'll name it nix.

```bash
 vgcreate nix /dev/mapper/cryptlvm
```

Create logical volumes on volume group. I'm creating three, one for encrypted swap
and another for home and last one for root.

```bash
 lvcreate -L 8G nix -n swap
 lvcreate -L 25G nix -n root
 lvcreate -l +100%FREE nix -n home
```

Now create filesystems.

```bash
 mkfs.ext4 /dev/mapper/nix-root
 mkfs.ext4 /dev/mapper/nix-home
 mkswap /dev/mapper/nix-swap
```

Mount them.

```bash
 mount /dev/mapper/nix-root /mnt
 mkdir /mnt/home
 mkdir /mnt/boot
 mount /dev/mapper/nix-home /mnt/home
 mount /dev/sda1 /mnt/boot
```
Turn the swap partition on.

```bash
 swapon /dev/mapper/nix-swap
```

### Install the base system

```bash
 pacstrap /mnt base base-devel linux linux-firmware
```

### Generate fstab

```bash
 genfstab -U /mnt >> /mnt/etc/fstab
```

> **_NOTE:_** If you're using an SSD, replace relatime with noatime in  /mnt/etc/fstab except boot partition.

### chroot into new system.

```bash
 arch-chroot /mnt
```

Set the timezone.

```bash
 ln -s /usr/share/zoneinfo/Asia/Karachi /etc/localtime
 hwclock --systohc
```

Replace Asia with your continent and Karachi with city.

Set hostname

```bash
 echo nix > /etc/hostname
```

Replace nix with name you wanna give your machine to.

Set locales

```bash
 vim /etc/locale.gen

  #en_HK ISO-8859-1  
  #en_IE.UTF-8 UTF-8  
  #en_IE ISO-8859-1  
  #en_IE@euro ISO-8859-15  
  #en_IL UTF-8  
  #en_IN UTF-8  
  #en_NG UTF-8  
  #en_NZ.UTF-8 UTF-8  
  #en_NZ ISO-8859-1  
  #en_PH.UTF-8 UTF-8  
  #en_PH ISO-8859-1  
  #en_SC.UTF-8 UTF-8  
  #en_SG.UTF-8 UTF-8  
  #en_SG ISO-8859-1  
  en_US.UTF-8 UTF-8  
  #en_US ISO-8859-1  
  #en_ZA.UTF-8 UTF-8  
  #en_ZA ISO-8859-1  
  #en_ZM UTF-8  
  #en_ZW.UTF-8 UTF-8  
  #en_ZW ISO-8859-1  
  #eo UTF-8  
  #es_AR.UTF-8 UTF-8  
  #es_AR ISO-8859-1  
  #es_BO.UTF-8 UTF-8  
```
Uncomment en_US.UTF-8 UTF-8 . (remove # from the beginning)

```bash
 echo LANG=en_US.UTF-8 > /etc/locale.conf
 locale-gen
```

Install some necessary software.

```bash
 pacman -S wpa_supplicant dhclient dialog
```

Create a user.

```bash
 useradd -m -G wheel 'username'
 passwd 'username'
```

Create root password

```bash
 passwd
```

### mkinitcpio configuration

Edit the file **/etc/mkinitcpio.conf**. Copy this line or write in order in hooks line. Order matters so don't ignore or you will get un-bootable system.

```bash
 vim /etc/mkinitcpio.conf

HOOKS=(base udev autodetect keyboard keymap consolefont modconf block encrypt lvm2 filesystems resume fsck)

```

Generate mkinitcpio

```bash
mkinitcpio -p linux
```

### Install bootloader

```bash
 bootctl install 
```

Create entries.

Create a file **/boot/loader/entries/arch.conf**.
```bash
 vim /boot/loader/entries/arch.conf

title	ArchLinux
linux	/vmlinuz-linux
initrd	/initramfs-linux.img
options cryptdevice=UUID=<YOUR-PARTITION-UUID>:lvm:allow-discards resume=/dev/mapper/nix-swap root=/dev/mapper/nix-root rw quiet

```
Where UUID you can get using blkid. It would be in /dev/sda2.

### Un-mount and reboot

```bash
 exit
 umount /mnt
 reboot
```

Remove the USB device. And enjoy your new archlinux encrypted installation.

