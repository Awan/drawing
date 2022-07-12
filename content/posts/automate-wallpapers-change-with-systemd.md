---
author: Abdullah Khabir
layout: post
title: "Automate the boring stuff of wallpapers with systemd"
date: 2019-05-08
url: wallpaper-automation
comments: true
description: "Automate the boring stuff of wallpapers with systemd"
tags: 
 - 'wallpapers'
 - 'automation'
 - 'systemd'
 - 'systemd timer'
 - 'systemd unit'
cover: "images/beautify.jpeg"
keywords: ["linux auto change background", "linux wallpaper", "linux mint change desktop background automatically", "live wallpaper linux", "ubuntu 20 04 wallpaper changer", "how to change desktop wallpaper on ubuntu", "variety wallpaper changer", "wallch", "install wallch", "variety ubuntu", "gnome slideshow background", "variety vs wallch", "how to change desktop wallpaper on ubuntu", "ubuntu 20.04 screensaver settings", "install wallch ubuntu", "ubuntu 20.04 wallpapers", "ubuntu 20.04 xscreensaver", "desktop nova", "little simple wallpaper changer", "wallpaper changer manjaro", "raspberry pi wallpaper slideshow", "linux change desktop background command line", "ubuntu change wallpaper based on time", "best wallpaper ubuntu", "linux mint wallpaper slideshow", "linux wallpaper changer script", "pop os wallpaper changer", "centos wallpaper slideshow", "variety not downloading", "best slideshow app for ubuntu", "kde wallpaper changer", "wallch", "install wallch", "variety ubuntu", "gnome slideshow background", "variety vs wallch", "how to change desktop wallpaper on ubuntu", "ubuntu 20.04 screensaver settings", "install wallch ubuntu", "ubuntu 20.04 wallpapers", "ubuntu 20.04 xscreensaver", "desktop nova", "little simple wallpaper changer", "wallpaper changer manjaro", "raspberry pi wallpaper slideshow", "linux change desktop background command line", "ubuntu change wallpaper based on time", "best wallpaper ubuntu", "linux mint wallpaper slideshow", "linux wallpaper changer script", "pop os wallpaper changer", "centos wallpaper slideshow", "variety not downloading", "best slideshow app for ubuntu", "kde wallpaper changer"]

---

So assuming you're not using a DE and don't wanna install a tool which comes
with a lot of dependencies just to automate the boring stuf of changing
wallpapers (root window of Xorg). I wrote a simple Python
[program](https://github.com/Awan/beautify.git) which you can use as systemd
unit too.

Clone the [repository](https://github.com/Awan/beautify.git) or download/copy
the beautify.py if you don't want systemd part. I'd recommend ~/bin for such
executable scripts. You can execute it from _.xinitrc_ or _.xprofile_. For
systemd there is explaination in repository readme file too.

```bash
$ git clone https://github.com/Awan/beautify.git
$ cp beautify/beautify.py ~/bin/beautify
$ cp beautify/systemd/beautify.service ~/.config/systemd/user/default.target.wants/
$ systemctl enable --user beautify.service
$ systemctl start --user beautify.service
```

Don't forget to edit the beautify.service. Add path
to beautify script where you copied it, and also add
your wallpapers collection's path and duration.


If you wanna execute it without systemd, you can
copy the _beautify.py_ to ~/bin and execute it from
_~/.xinitrc_ or _~/.xprofile_ like this.


```
$ vi ~/.xinitrc
...

~/bin/beautify ~/pix/wallpapers 300
...

:wq!
```

It will change the wallpapers from _~/pix/wallpapers_ every 5
minutes. Enjoy!

Here is a demonstration video.

{{< youtube ep-gb9cyykg >}}
