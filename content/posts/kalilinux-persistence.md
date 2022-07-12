---
title: "Kalilinux Persistence"
date: 2020-07-14T17:22:11+05:00
draft: false
author: "Abdullah Khabir"
toc: true
comments: true
layout: post
tags: ["kali linux", "kali linux persistence", "usb", "linux in usb", "bootable"]
description: ["How to make kali linux persistence in a USB"]
keywords: ["kali linux", "kali linux persistence", "kali linux in usb"]
---

## Getting Kalilinux image

Go to [Downloads](https://kali.org/downloads) and download latest live image. Make sure you don't download the installer image.

## Make USB bootable

Use `dd` to write the kali image to USB.

In linux environment:

```bash
# dd if=kali-linux-xxxx.x-live-amd64.iso of=/dev/sdX status=progress bs=4M
```

Replace `kali-linux-xxxx.x-live-amd64.iso` with downloaded iso iamge path and `/dev/sdX` with path of your USB device. You can find USB path by running `lsblk` in terminal. Make sure you don't select the existing linux installation drive.


## Create persistence partition

Create a primary partition with `fdisk`:

```bash
# fdisk /dev/sdx

Welcome to fdisk (util-linux 2.35.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

The device contains 'iso9660' signature and it will be removed by a write command. See fdisk(8) man page and --wipe option for more details.

Command (m for help): n
Partition type
   p   primary (3 primary, 0 extended, 1 free)
   e   extended (container for logical partitions)
Select (default e):p

Selected partition 3

```

Press `n` to create a new partition. Type `p` to make it primary. Hit enter twice so all the remaining space would be allocated to new partition.

Type `w` to write changes to USB drive.

## Create filesystem

Create ext4 filesystem in new partition.

```bash

# mkfs.ext4 /dev/sdX3 -L persistence
# e2label /dev/sdX3 persistence

```

## Mount new partition

Mount the new created partition somewhere in your filesystem.

```bash

# mount /dev/sdX3 /mnt

```

## Create configuration

Create a configuration file in new partition which we mounted earlier at `/mnt`:


```bash

# echo "/ union" > /mnt/persistence.conf

```

## Un-mount the partition


Un-mount the partition.

```bash

# umount /dev/sdX3

```

## Reboot

Reboot and press your hardware dedicated button to boot from new created USB. Don't forget to select the persistence option from Kali menu.



Thanks for reading. :wink:





