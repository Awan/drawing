---
title: "OpenBSD Encrypted Install"
subtitle: ""
date: 2021-02-09T20:12:36+05:00
lastmod: 2021-02-09T20:12:36+05:00
draft: false
author: "Abdullah Khabir"
authorLink: "https://abdullah.today"
description: "How to install OpenBSD with full disk encryption"

tags: [openbsd, encryption, full disk encryption, encrypted openbsd install]
categories: []

hiddenFromHomePage: false
hiddenFromSearch: false

featuredImage: ""
featuredImagePreview: ""

toc:
  enable: true
math:
  enable: false
lightgallery: false
license: ""
---

So this is how you can have a fully encrypted OpenBSD installation.

### Getting OpenBSD

Go to [OpenBSD website](https://www.openbsd.org/faq/faq4.html#Download) and download the _.img_ file for your hardware.

### Creating install media

If you are on some linux or mac, you can use `dd` command to burn it to USB drive.

Suppose your USB drive is appearing as `/dev/sdb` in `lsblk`'s output:

```bash
dd if=install.img of=/dev/sdb bs=1M
```

### Boot from install media

Plug the new install media and reboot the system. Once its starting, press the dedicated button to get the boot options screen. Select the USB drive and hit Enter.

### Get command prompt

We are going to do an encrypted install so press `S` (shell) to get a command prompt.

Once you got a command prompt, type:

```bash
sysctl hw.disknames
```
It will show you disks. First one might be your hard drive/SSD like `sd0`.

You can verify your drive by running:

```bash
disklabel /dev/sd0
```

### Erase data on drive

Once you're sure with target drive, erase data on drive. Its optional step though.

```bash
cd /dev && sh MAKEDEV sd0
dd if=/dev/urandom of=/dev/rsd0c bs=1m
```

### Partitioning

```bash
fdisk -iy -g -b 960 sd0
disklabel -E sd0
Label editor (enter '?' for help at any prompt)
sd0> a a			
offset: [1024]
size: [39825135] *
FS type: [4.2BSD] RAID
sd0*> w
sd0> q
No label changes.
```

### Encryption

```bash
bioctl -c C -l sd0a softraid0
New passphrase:
Re-type passphrase:
sd1 at scsibus2 targ 1 lun 0: <OPENBSD, SR CRYPTO, 005> SCSI2 0/direct fixed
sd1: 19445MB, 512 bytes/sector, 39824607 sectors
softraid0: CRYPTO volume attached as sd1
```

Keep in mind /dev/sd1 exists:

```bash
cd /dev && sh MAKEDEV sd1
```

### Zero out first Megabyte

```bash
dd if=/dev/zero of=/dev/rsd1c bs=1m count=1
```

### Back to installer

Type `exit` to get the installer screen back. Now just give it the newly encrypted device for installation.
