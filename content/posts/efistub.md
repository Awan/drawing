---
author: Abdullah Khabir
comments: true
toc: true
date: 2019-09-13
layout: post
url: EFISTUB
title: EFISTUB
description: 'How to boot linux kernel without grub or extra boot manager'
tags:
  - efistub
  - efibootmgr
  - bootloader
keywords: ["efistub", "boot with uefi", "no bootloader linux", "boot linux kernel without bootloader", "uefi", "ubuntu efistub", "debian efistub", "genkernel efistub", "efistub vs systemd boot", "refind", "gentoo efistub", "efibootmgr", "gummiboot", "efistub vs systemd-boot", "efibootmgr remove entry", "efibootmgr mac", "efibootmgr manjaro", "efibootmgr source", "arch grub efi", "bzimage efi", "efi stub secure boot is enabled", "how to boot debian without grub", "arm64 efi boot", "grub efi device tree", "efi configuration table", "linux efi_main", "e820 uefi", "debian efistub install", "stub kernel", "gentoo efi", "efibootmgr add efi file", "gentoo esp partition", "efi manager", "gentoo gpt", "evil maid attack", "arch linux", "efistub vs systemd-boot", "efibootmgr remove entry", "efibootmgr mac", "efibootmgr manjaro", "efibootmgr source", "arch grub efi", "bzimage efi", "efi stub secure boot is enabled", "how to boot debian without grub", "arm64 efi boot", "grub efi device tree", "efi configuration table", "linux efi_main", "e820 uefi", "debian efistub install", "stub kernel", "gentoo efi", "efibootmgr add efi file", "gentoo esp partition", "efi manager", "gentoo gpt", "evil maid attack", "arch linux"]
---

![efistub](/images/efistub.jpeg)


So in this post I'm gonna guide you how you can use efistub, a feature which you can use to boot the kernel without an extra boot manager(grub, systemd-boot, rEFInd etc.)
            
Create a boot entry using efibootmgr.

```
# efibootmgr --create --disk /dev/sda --part 1 --label Debian --loader /vmlinuz --unicode "root=/dev/sda2 rw initrd=\initrd.img" --verbose
```
    
Explaination of the command.

```
 --create 'creates a new boot entry'
 --disk   'disk where you wanna create the boot entry'
 --part   'partition number'
 --label  'the label for new entry'
 --loader 'loader to boot, it's vmlinuz in this example'
 --unicode 'kernel parameters you can define here like initrd, swap, encrypted container for root'
 --verbose 'let it verbose'
```

I have an encrypted installation on my machine so here is how I create an entry for me.
   
```
# efibootmgr --create --disk /dev/sda --part 1 --label 'My Debian' --loader /vmlinuz --unicode "cryptdevice=UUID=XXXXXXXXXXXXXXXXXX:cryptlvm root=UUID=XXXXXXXXXXXXXXXXXX rw initrd=\initrd.img resume=UUID=XXXXXXXXXXXXXXXXX" --verbose
```

where cryptdevice UUID is the UUID of my SSD's encrypted container's UUID and root's UUID is the UUID for my lvm volume where root is located, resume UUID is the lvm UUID where swap partition is. You can get UUID with blkid command. 


Now go to /boot directory and check for the vmlinuz and initrd.img. They might be in child directories like if EFI/grub or maybe somewhere else depending on your current boot managers. and move them to /boot. Also change your fstab (/etc/fstab) so that it mount your boot partition on /boot.

```
# mv /boot/efi/grub/vmlinuz-4.19.0-1-rt-amd64 /boot/vmlinuz
# mv /boot/efi/grub/initrd.img-4.9.0-8-amd64 /boot/initrd.img
```
and your fstab should be look like this.

```
UUID=XXXX-XXXX    /boot     vfat    umask=0077  0   1
```

By default, debian installs kernel and initrd images with their version numbers. But also puts a symlink to it in / with vmlinuz name. So we have to write a script so that if we get an update of kernel, it will automatically rename it to vmlinuz and initrd.img. Just create a script with following path and make it executable. 

```
# vim /etc/kernel/postinst.d/update-efistub

#!/bin/sh
cp /vmlinuz /boot/

```
save it and make it executable.

```
# chmod +x /etc/kernel/postinst.d/update-efistub
```


and do the same with initramfs.

```
# vim /etc/initramfs/post-update.d/update-efistub

#!/bin/sh
cp /initrd.img /boot/

```

make it executable.

```
chmod +x /etc/initramfs/post-update.d/update-efistub
```

That's it. Now uninstall any extra boot manager and reboot. You'll see that your machine is booting without a boot manager. Yeah, you heard it right. No sensible person will call it bootloader. They are just boot managers which also create an entry just like we did. So why don't we do it ourselves. Feel free to mail me if you get some errors.

> **_NOTE:_** On a standard debian installation, installer creates an *ESP* if
not already exists, and formats it as vFAT. And also creates another ext2
formatted partition. Installer mounts *ESP* as */boot/efi*. So for debian
standard install, your command looks like this.
```
# efibootmgr --create --disk /dev/sda --part 1 --label Debian --loader
'\EFI\debian\vmlinuz' --unicode 'root=UUID=XXXX-XXXX-XXXX-XXX ro quiet
initrd=\\EFI\\debian\\initrd.img' --verbose
```

and for an encrypted installation with lvm, it should be.

```
# efibootmgr --create --disk /dev/sda --part 1 --label Debian --loader
'\EFI\debian\vmlinuz' --unicode 'cryptdevice=UUID=XXXX-XXXX-XXXX-XXXX:cryptlvm
root=UUID=XXXX-XXXX-XXXX-XXXX ro quiet initrd=\\EFI\\debian\\initrd.img
resume=UUID=XXXX-XXXX-XXXX-XXXX' --verbose
```
where first UUID is your /dev/sda3 encrypted container UUID, root UUID is where
rootfs is installed and resume UUID is your encrypted swap partition UUID.
