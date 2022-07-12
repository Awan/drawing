---
author: "Abdullah Khabir"
layout: post
date: 2019-09-22
tags: ["debian", "fresh install"]
keywords: ["first steps after debian install", "30 things after debian install", "things to do after installing debian 9", "things to do after installing debian 8", "30 things to do after installing debian 10", "10 things you must do after installing debian 10", "things to do after installing antix", "how to make debian faster", "debian post install script", "debian 10 setup", "best apps for raspbian buster", "average linux", "how to use debian", "how do i install update drivers on debian 10", "things to do after installing debian 8", "30 things after debian install", "debian broken" ]
title: 'Things to do after a new Debian installation'
description: 'Things to do after a new Debian installation'
url: debian-fresh-install
comments: true
---

So you have a new Debian installation? Maybe a minimal install like I do? 
Don't worry, I have you covered what to do next.


## Setup a sudo user without password  

Go [here](https://abdullah.today/enable-sudo-with-no-password.html).



## Install software

Install software for daily use. 

```
$ sudo apt install build-essential \
 git zsh mpv feh xss-lock urlview \
 xbindkeys stow offlineimap mutt msmtp \
 notmuch vim.nox rxvt-unicode -y 
 ```

## Setup touchpad

If you have a machine that supports multitouch, enabling tap to click is a good option. Create directories if they don't have already created.

```
$ sudo mkdir -p /etc/X11/xorg.conf.d
```

Create a file here as 20-libinput.conf. Mine looks like:

```
$ cat /etc/X11/xorg.conf.d/20-libinput.conf

Section "InputClass"
	Identifier "libinput touchpad catchall"
  MatchIsTouchpad "on"
  Driver "libinput"
  MatchDevicePath "/dev/input/event*"
  Option "Tapping" "on"
  Option "TappingButtonMap" "lrm"
  Option "NaturalScrolling" "true"
EndSection
```


## Brightness Keys  

On some hardware, brightness keys don't work out of the box. So create a file
<b>30-backlight.conf</b> in the same directory as you did in touchpad file.

```
$ cat /etc/X11/xorg.conf.d/30-backlight.conf 

Section "Device"
	Identifier "card0"
	Driver	   "intel"
	Option	   "Backlight" "intel_backlight"
	BusID      "PCI:0:2:0"
EndSection
```


## Automatically lock screen on resume from suspension  

systemd-logind automatically suspends the laptop if lid is closed. But you have
to create another unit file and enable it to lock the screen on resume from
suspension.

Create a file <b>/etc/systemd/system/wakelock@.service</b> with following
contents. Put your favorite locker application path in ExecStart if you don't
use slock.

```
$ cat /etc/systemd/system/wakelock@.service

[Unit]
Description=Automatically lock the screen on resume from suspension
Before=sleep.target suspend.target

[Service]
User=%i
Environment=DISPLAY=:0
ExecStart=/usr/bin/slock

[Install]
WantedBy=sleep.target suspend.target
```

Reload the systemd daemon and enable/start it. Replace <b>YOUR USERNAME</b> with
your username.

```
$ sudo systemctl daemon-reload
$ sudo systemctl enable wakelock@<YOUR USERNAME>.service
$ sudo systemctl start wakelock@<YOUR USERNAME>.service
```


That's it. I'll update this article for more things I remember or anytime I had
to reinstall and find something I had to do...
