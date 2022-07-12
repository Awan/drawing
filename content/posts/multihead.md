---
title: "Multihead with BSPWM and Polybar"
date: 2020-06-02T10:52:37+05:00
author: "Abdullah Khabir"
tags: ['polybar', 'bspwm', 'multihead', 'multi-display', 'multi-screen', 'dual-monitor', 'dual-screen', 'multimonitor']
comments: true
toc: true
description: "How to configure dual screen in linux?"
url: '/multihead'
layout: post
featuredImage: "/images/dual-monitor.jpeg"
---

# Multihead


A few days ago, I relocated myself to new room. Actually this room I use for
summer as its way cooler than others. I have a wall-mounted LCD monitor here so
today I thought I should share how I do multi screening.

## Hardware

I have this lenovo X series machine which is my main machine I use.
Its resolution is 1920x1080.

![x1 carbon](/images/multi-2.jpeg)

The second one is a LCD monitor. And the resolution is 1280x1024.

My laptop doesn't have VGA port but I have a HDMI port. But I have worked on old
hardware with VGA port and it works.

## Software

`xrandr` is what you want. I'm using Archlinux and it got installed with
`libinput` as dependency. I hope it will be there in other distributions as
well. If you don't have it, install it using your distribution's package
manager.

I use _bspwm_ with _polybar_. You might have different _WMs_ or _DE_. Apart from
polybar, everything would work fine. For polybar, you have to configure it to
your taste. Or clone my [git repository](https://gitlab.com/Abdullah/cfg.git)
and copy/symlink all files to their respective paths and polybar will work fine.

## Display manager


I don't use a Display manager. Instead I use _xinit_. See next section for
configuring multihead using _xinit_.

## Starting on Boot

In _bspwm_, when you plug HDMI cable in, OS detects it. But for screens to get
display, you have to logout from _bspwm_.
Login again and without configuration, the monitor would be a mirror to your
laptop. What ever you see on first screen, you would see on second one.

To make it work, you need to execute some commands.

First get outputs names using _xrandr_ without some arguments.

```bash

xrandr

Screen 0: minimum 320 x 200, current 3200 x 1080, maximum 16384 x 16384
eDP-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 309mm x 173mm
   1920x1080     60.03*+  60.01    59.97    59.96    59.93
   1680x1050     59.95    59.88
   1400x1050     59.98
   1600x900      59.99    59.94    59.95    59.82
   1280x1024     60.02
   1400x900      59.96    59.88
   1280x960      60.00
   1440x810      60.00    59.97
   1368x768      59.88    59.85
   1280x800      59.99    59.97    59.81    59.91
   1280x720      60.00    59.99    59.86    59.74
   1024x768      60.04    60.00
   960x720       60.00
   928x696       60.05
   896x672       60.01
   1024x576      59.95    59.96    59.90    59.82
   960x600       59.93    60.00
   960x540       59.96    59.99    59.63    59.82
   800x600       60.00    60.32    56.25
   840x525       60.01    59.88
   864x486       59.92    59.57
   700x525       59.98
   800x450       59.95    59.82
   640x512       60.02
   700x450       59.96    59.88
   640x480       60.00    59.94
   720x405       59.51    58.99
   684x384       59.88    59.85
   640x400       59.88    59.98
   640x360       59.86    59.83    59.84    59.32
   512x384       60.00
   512x288       60.00    59.92
   480x270       59.63    59.82
   400x300       60.32    56.34
   432x243       59.92    59.57
   320x240       60.05
   360x202       59.51    59.13
   320x180       59.84    59.32
DP-1 disconnected (normal left inverted right x axis y axis)
HDMI-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
HDMI-2 connected 1280x1024+1920+0 (normal left inverted right x axis y axis) 708mm x 398mm
   1280x1024     60.02*+
   1920x1080     60.00    50.00    59.94    24.00    23.98
   1920x1080i    60.00    50.00    59.94
   1280x960      60.00
   1280x720      60.00    50.00    59.94
   1024x768      60.00
   800x600       60.32    56.25
   720x576       50.00
   720x576i      50.00
   720x480       60.00    59.94
   720x480i      60.00    59.94
   640x480       60.00    59.94
   720x400       70.08

```

Or to get connected monitors, you can invoke:

```bash

xrandr -q | awk '/ connected / {print $1}'

```
You will get output of _N_ lines where _N_ is numbers of connected monitors.

The first one you see is your laptop. Others are external monitors if you have
not configured them already or have something in your $PATH which does something
on hardware change.

Okay. Let's assume my laptop is _eDP-1_ and my external monitor is _HDMI-2_.
I want external monitor to appear at right of my laptop screen:

```bash
xrandr --output HDMI-2 --auto --right-of eDP-1

```

That's it. You can save these two functions in your _~/.xprofile_ to auto
start multihead on restart. As the configurations above we done, will go
away after this session.

Here is my _~/.xpofile_:

```bash

$ vim ~/.xprofile_

#!/bin/sh
# In the name of Allah, the most Gracious, the most Merciful.
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ Author ▓ Abdullah <https://abdullah.today>
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░


# Xresources file
user_resources=$HOME/.Xresources
# custom keymaps
user_keymaps=$HOME/.Xmodmap
# custom fonts
user_fonts_dir=$HOME/.local/share/fonts
# Inactivity timeout
inactivity_timeout=180
# Time before exectuing lock
notify_time=10

# For some java apps

#wmname LG3D &

run() {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x $f ] && . $f
    done
    unset f
fi

# Session name
export DESKTOP_SESSION=bspwm
# No tty
export XDG_SESSION_TYPE=x11

tab() {
  # Configure only laptop's screen if no external monitor is connected.
  xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --brightness 1.0 \
    --gamma 0.76:0.75:0.68 "$@"
}

tabular() {
  # Configure external monitor if exists
  tab
  xrandr --output HDMI-2 --mode 1280x1024 --pos 1920x0 "$@"
}

# Start sxhkd

sxhkd &

# Load Xresources

[ -f $user_resources ] && xrdb -merge "$user_resources"

# Load keymaps

[ -f $user_keymaps ] && xmodmap "$user_keymaps"

# Run compositor

run picom -b --config "$HOME"/.config/picom/picom.conf &

# Restore the last wallpaper

"$HOME"/.fehbg &

# Set cursor shape

xsetroot -cursor_name ul_angle &

#xcompmgr -c -f D 5 &

# Add fonts directories

xset +fp "$user_fonts_dir" && xset fp rehash

# Start urxvt in daemon mode

# run urxvtd -q -o -f &

# No mouse when idle

run unclutter --ignore-scrolling --fork --timeout 1 &

# DPMS and lock screen

xset dpms $inactivity_timeout &
#xss-lock -- physlock -mp 'Say, "If the sea were ink for [writing] the words of my Lord, the sea would be exhausted before the words of my Lord were exhausted, even if We brought the like of it as a supplement."' &
xss-lock -- i3lock -c 000000 &

# Start Notification daemon

run dunst -c "$HOME"/.config/dunst/dunstrc &

# Mute the mic

pactl set-source-mute alsa_input.pci-0000_00_1b.0.analog-stereo true &

# Redshift for less eye strain

#redshift -c ~/.config/redshift/redshift.conf &

# Start tmux if not already running

[ -z $TMUX ] && tmux new-session -s $USER -d

# Set brightness to 30 at boot

light -S 30 &

# Configure multihead.

if [ "$(xrandr -q | awk '/ connected / {print $1}' | wc -l)" -eq 1 ]; then
  tab --primary
else
  tabular
fi

# Start a scratchpad

#sleep 1
#urxvtc -T 'scratchpad' -geometry 65x20 &
#termite -t scratchpad &
xfce4-terminal -T scratchpad --font='Fantasque Sans Mono Italic 16' &

# vim:ft=sh

:wq

```

Change the resolution and outputs name in it and enjoy multiheading. :wink:

Here is a demonstration video.

{{< youtube Gjj-wcdc0-w >}}
