---
title: "Things to Do After New OpenBSD Install"
subtitle: ""
date: 2021-02-10T18:52:24+05:00
lastmod: 2021-02-10T18:52:24+05:00
draft: false
author: "Abdullah Khabir"
authorLink: "https://abdullah.today"
description: ""

tags: [openbsd, new install, encrypted installation, todo, backlight openbsd, 
xorg setup openbsd, openbsd wsconctl]
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

So you have installed OpenBSD as main OS. Most of the things will work out of the box. But still you have to configure some things.

### Lock screen on suspend/hibernate/resume

Login as root and create `/etc/apm` directory if it isn't there already.

```bash
mkdir /etc/apm
echo "pkill -USR1 xidle" > /etc/apm/suspend
echo "pkill -USR1 xidle" > /etc/apm/resume
echo "pkill -USR1 xidle" > /etc/apm/hibernate
chmod +x /etc/apm/suspend
chmod +x /etc/apm/hibernate
chmod +x /etc/apm/resume
```

On lid closure, machines mostly get suspended. But once you open it up, they won't be locked. Due to these scripts we just created, they will be locked now.

### Wheel group

Add your user to `wheel` and `staff` group.

```bash
usermod -G wheel,staff 'your username'
```

### Configure `doas`

In OpenBSD, we have alternative of `sudo`. Although you can install and use 
`sudo` but it has security issues.

We have already added our user to `wheel` group so now we will configure `doas` 
to allow `wheel` group members runnig privileged commands without password.

Add this line to `/etc/doas.conf`

```bash
vi /etc/doas.conf
...
permit nopass keepenv :wheel
...
```

### Power management with `apmd`

`apmd` is Advanced Power Management Daemon. You can use it to save some power and also for cooling CPU.

I have found this settings very useful for my laptop.

```bash
rcctl enable apmd
rcctl set apmd flags "-C -z 45"
```

You can adopt it to your needs. `-C` flag will increase or decrease CPU speed depending on CPU load.

The CPU speed with this will be increased to 50% every second if the load is over 70%. Once the load drops under 70%, apm will decrease the CPU speed 20% every second till the CPU is at its lowest speed.

If you're working and want to make sure CPU is running at full, just execute `apm -H`. And it will clock the CPU to full speed. After you're done, just execute `apm -C` to put the system back into cool running mode.

About the `-z 45` flag, well, I'm a lazy person. Sometimes I leave my laptop opened and fell asleep and in the next hour there might be a power shutdown for hours. This flag actually allows you to put your machine into suspend mode once battery level goes below 45% saving you some battery juice. 

There is also `-Z` flag for hibernate. You can try both of them. The last one will supersede the other.

### login.conf

Change `datasize-max` and `datasize-cur` values to `4096M`.
Also change `openfiles-max` and `openfiles-cur` to `4096`.

```bash
vi /etc/login.conf
...

default:\
	:path=/usr/bin /bin /usr/sbin /sbin /usr/X11R6/bin /usr/local/bin /usr/local/sbin:\
	:umask=022:\
	:datasize-max=4096M:\
	:datasize-cur=4096M:\
	:maxproc-max=256:\
	:maxproc-cur=128:\
	:openfiles-max=4096:\
	:openfiles-cur=4096:\
	:stacksize-cur=4M:\
	:localcipher=blowfish,a:\
	:tc=auth-defaults:\
	:tc=auth-ftp-defaults:

...
```

### Disable console log

`xenodm` is default display manager. It enables a console log once `X` is started. You can disable it by commenting the line like this.

```bash
vi /etc/X11/xenodm/Xsetup_0
...
# xconsole -geometry 480x130-0-0 -daemon -notify -verbose -fn fixed -exitOnFail
...
```

### Ending this post

There are lot more things I have configured by hand. This list is still not 
completed. I'll keep it updated as I get some free time :)

Thanks for reading...
