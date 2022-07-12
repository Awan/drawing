---
layout: post
comments: true
author: Abdullah Khabir
date: 2019-09-11
url: dwm
title: dwm window manager
description: Tiling window manager that sucks less
tags:
- dwm
- windowmanager
- suckless
cover: "images/dwm.jpeg"
keywords: ["dwm", "how to install dwm", "how to use dwm", "dwm vs i3", "dwm windows", "dwm github", "dwm windows 10", "i3 window manager", "awesome window manager", "dwm patches", "dwm vs bspwm", "dwm vs i3", "dwm tutorial", "understanding dwm", "install dwm ubuntu", "dwm patches", "developing world markets", "xmonad wikipedia", "i3 programming", "awesomium wikipedia", "ratpoison wikipedia", "ubuntu dwm", "frankenwm", "dwm windows 10", "dwm gaps", "fedora dwm", "dwm archwiki", "dwm change keybinding", "freebsd dwm config", "feh dwm", "dwm patching tutorial", "dwm status bar", "dwm polybar", "arch linux how to install dwm", "dwm change mod key", "spectrwm compton", "bspwm getting started", "monsterwm", "dwm default key bindings", "desktop window manager high gpu", "desktop window manager high cpu", "how to stop dwm", "dwm.exe end process", "desktop window manager is disabled", "desktop window manager high memory windows 10", "alpine awesome", "alpine install lxqt", "install desktop on alpine linux", "dwm dependencies", "alpine how to", "alpine linux vmware", "dwm vs i3", "dwm tutorial", "understanding dwm", "install dwm ubuntu", "dwm patches", "developing world markets", "xmonad wikipedia", "i3 programming", "awesomium wikipedia", "ratpoison wikipedia", "ubuntu dwm", "frankenwm", "dwm windows 10", "dwm gaps", "fedora dwm", "dwm archwiki", "dwm change keybinding", "freebsd dwm config", "feh dwm", "dwm patching tutorial", "dwm status bar", "dwm polybar", "arch linux how to install dwm", "dwm change mod key", "spectrwm compton", "bspwm getting started", "monsterwm", "dwm default key bindings", "desktop window manager high gpu", "desktop window manager high cpu", "how to stop dwm", "dwm.exe end process", "desktop window manager is disabled", "desktop window manager high memory windows 10", "alpine awesome", "alpine install lxqt", "install desktop on alpine linux", "dwm dependencies", "alpine how to", "alpine linux vmware"]
---
## What's **DWM**?

[DWM](https://dwm.suckless.org) is a Tiling window manager by [Suckless
community](https://suckless.org/).

### Installation

You can install **dwm** by using your distribution package maangers. But as
**dwm** is configured by hand before compilation, so it's recommended you clone
its repository, configure and then compile it for your system. I have a
[fork](https://gitlab.com/Abdullah/dwm.git) which you may like.

## Configuration

In the root directory, there is a file **config.h**. You can edit it how you
like. After editing run **make** and then as root (if you wanna install
as system-wide) or copy the **dwm** executable file to your path.

Let's take a look at my fork compiled **dwm**.

The default Modifier is Super Key (Windows key on most laptops). You can change it to Alt key or whatever you like.  From now on I'm using Mod for super key.

Let's open a window. The first window will always be in full screen.

![](/images/dwm-default.jpeg)

Let's add more windows. I'll introduce you some terms used in Window Managers.
The larger area is called Master. When you open new windows, the first window is pushed to stack area. Take a look at this screenshot.

![](/images/dwm-2.jpeg)

Add another terminal window.

![](/images/dwm-3.jpeg)

If you wanna move the window in stack area to come back in Master area,
just focus it with <b>Mod + j/k</b> and then press <b>Mod + Shift +
Return</b>.

![](/images/dwm-move.jpeg)

You can resize the increase/decrease Master area with <b>Mod + h/l</b>.

![](/images/dwm-resize.jpeg)

For now, it's enough for you to get started. I'll update it soon. In sha
Allah.

Here is a demonstration video.

{{< youtube QweZB60EG4g >}}
