---
title: "BSPWM"
author: Abdullah Khabir
date: 2020-06-01T19:02:44+05:00
tags: ['bspwm', 'wm', 'window managers', 'tiling window manager', 'workflow']
comments: true
toc: true
cover: "images/bspwm.jpeg"
description: "A tiling window manager"
url: "bspwm"
layout: post
keywords: ["how to use bspwm", "bspwm vs i3", "bspwm ubuntu", "bspwm vs dwm", "bspwm bar", "bspwm github", "bspwm cheat sheet", "arch bspwm", "bspwm cheat sheet", "bspwm meaning", "bspwm reddit", "bspwm wayland", "bspwm gentoo", "example bspwmrc", "bspwm black screen", "polybar bspwm", "sxhkd", "bspwm rounded corners", "bspwm kde", "bspwm manjaro", "bspwm not working", "bspwm/autostart", "bspwm means", "bspwm vs awesome", "i3 wm"]
---

# BSPWM

BSPWM is a tiling window manager that represents windows as the leaves of a
full binary tree. It has support for [EWMH](https://specifications.freedesktop.org/wm-spec/wm-spec-latest.html) and multihead.

## Installation

bspwm is available in almost all major distributions. If you can't find it in
your OS, clone the [repository](https://github.com/baskerville/bspwm) and
build it.

## Configuration

_bspwm_ uses _sxhkd_ for keyboard shortcuts. It has no other way to handle with keyboard input and instead provides _bspc_ program as its interface.
So you have to configure the keyboard shortcuts in another file.
_bspwm_ installs _sxhkd_ as its dependency mostly. If you don't want to use it and
want to use some other hotkey daemon like _xbindkeys_ or something else, you can
install that and configure it for you. _sxhkd_ is from the same developer as
_bspwm_ with powerful and compact configuration syntax.

Create directories first:

```bash
mkdir -p ~/.config/{bspwm,sxhkd}

```
Copy the configuration files from `/usr/share/doc/`. You might have a
different path for these files in your filesystem. Find them and copy over
there.

```bash
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
```
Cool. Now you have configuration files placed in correct location, you can
start _bspwm_ but wait. will you mind editing them?
Edit them with some editor and change the defaults to how you like, change default programs.

## Start
I use _xinit_ to start my window manager. But you can use any display manager
to boot into _bspwm_. Here is my `~/.xinitrc`:

```bash

$ cat ~/.xinitrc


#!/bin/sh

coded_by='

In the name of Allah, the most Gracious, the most Merciful.

▓▓▓▓▓▓▓▓▓▓
░▓ Author ▓ Abdullah <https://abdullah.today>
░▓▓▓▓▓▓▓▓▓▓
░░░░░░░░░░

░█▀▀░▀█▀░█▀█░█▀▄░▀█▀░█░█
░▀▀█░░█░░█▀█░█▀▄░░█░░▄▀▄
░▀▀▀░░▀░░▀░▀░▀░▀░░▀░░▀░▀
'


[ -f ~/.xprofile ] && . ~/.xprofile
exec bspwm >/tmp/bspwm-"$USER".log 2>&1
```
It's enought to boot into _bspwm_. But we want some programs to run at
startup.

## Auto-start programs

You can start applications from `~/.config/bspwmrc` or `~/.xprofile`.
If you use some display manager, you can start applications from `~/.xprofile`. It's sourced when display manager starts.

You can have a _autostart.sh_ in your `~/.config/bspwm/` and execute from `~/.config/bspwm/bspwmrc`:

```bash
cat ~/.config/bspwm/bspwmrc
...
$HOME/.config/bspwm/autostart.sh &
...
```
or a better way to do this is launching your programs from  `~/.xprofile` and
source it from `~/.xinitrc`. This way you can use any display manager or xinit and you don't need extra configuration or a script.

Here is my `~/.xprofile`:


```sh
cat ~/.xprofile


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

```

The file is well-commented. So you can copy and edit it to your likings.

## Bar/Panel

I'm using [polybar](https://github.com/jaagr/polybar) with _bspwm_. To be
honest, it was the reason I left [dwm](https://dwm.suckless.org) because
even with patching _dwm_, I wasn't able to use polybar with it. _bspwm_ is
*EWMH* supported so you can use almost any bar with it.
I'm starting polybar from `~/.config/bspwm/bspwmrc`. More on polybar, you
can find a [post](https://abdullah.today/polybar) in my blog to know more about
it.

## Rules

In _bspwm_, you can define rules for windows how and where they appear.
You can add a rule in `~/.config/bswpm/bspwmrc` like this:

```bash
bspc rule -a Chromium desktop=^2
```
This rule will always open Chromium on desktop 2.

Or if you have some applications with complex window rules, you can define
them in a script and execute that script from `~/.config/bspwm/bspwrc` like
this:

```bash
bspc config external_rules_command "$HOME/.config/bspwm/external_rules"

```

Here is my _external_rules_ script:

```bash
$ cat ~/.config/bspwm/external_rules


#!/bin/sh

coded_by='

In the name of Allah, the most Gracious, the most Merciful.

 ▓▓▓▓▓▓▓▓▓▓
░▓ Author ▓ Abdullah <https://abdullah.today>
░▓▓▓▓▓▓▓▓▓▓
░░░░░░░░░░

░█▀▄░█▀▀░█▀█░█░█░█▄█░░░█▀▄░█░█░█░░░█▀▀░█▀▀
░█▀▄░▀▀█░█▀▀░█▄█░█░█░░░█▀▄░█░█░█░░░█▀▀░▀▀█
░▀▀░░▀▀▀░▀░░░▀░▀░▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀
'


wid=$1
class=$2
instance=$3
title=$(xdotool getwindowname $wid)

case $class in
  [Rr]edshift-*|[Tt]int2|[Pp]inentry-*|[Mm]pv|[Mm]u[Pp][Dd][Ff]|[Mm]Player|[Tt]hunar|[Ff]im|[Gg]picview|[Nn]itrogen|[Aa]randr|[Gg]alculator|[Ff]ont-manager|[Oo]blogout|[Pp]eek|[Ss]kype|[Xx]fce4-appfinder|[Xx]fce4-about|[Gg]pick|[Gg]mrun|[Xx][Cc]alc|[Pp]avucontrol|[Vv]lc|[Ee]o[mg]|[Ff]eh|[Rr]istretto|[Ss]xiv|[Pp]qiv|[Aa]tril|[Ee]vince|[Zz]athura|scratchpad|fzfmenu)
  echo "state = floating"
  echo "center = on"
  ;;
  Google-chrome)
    echo "desktop = ^2"
    ;;
  Opera)
    echo "desktop = ^3"
    ;;
  Gimp)
   echo "desktop = ^5"
   ;;
 Anydesk)
   echo "desktop = ^4"
   echo "follow = on"
   ;;
esac

case $title in
  scratchpad)
    echo "state = floating"
    ;;
esac

# vim:ft=sh

```

## Scratchpad

I love to use a terminal emulator mostly. So I have a hidden terminal window
in floating mode. Whenever I need it, I just press the keybinds and it
appears on top of other apps so I can copy/paste something to it.

There are multiple way to achieve this. But what I have done is different. Not
just terminal window, any window can be pushed to scratchpad.

Copy this script in `~/.config/bspwm/scratchpad.sh`:

```bash
#!/bin/sh

coded_by='
In the name of Allah, the most Gracious, the most Merciful.

▓▓▓▓▓▓▓▓▓▓
░▓ Author ▓ Abdullah <https://abdullah.today>
░▓▓▓▓▓▓▓▓▓▓
░░░░░░░░░░

░█▀▀░█▀▀░█▀▄░█▀█░▀█▀░█▀▀░█░█░█▀█░█▀█░█▀▄
░▀▀█░█░░░█▀▄░█▀█░░█░░█░░░█▀█░█▀▀░█▀█░█░█
░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀░▀░▀░░░▀░▀░▀▀░
'


toggle_flag() {
id=$(bspc query -N -n "focused")
if [ -n "$id" ]; then
if [ $(xprop -id "$id" | grep "_SCRATCH_ORDER" | wc -l) -gt 0 ]; then
xprop -id $id -remove _SCRATCH_ORDER
xprop -id $id -remove _SCRATCH_VISIBILITY
else
xprop -id $id -f _SCRATCH_ORDER 32ii -set _SCRATCH_ORDER $(date +%s,%N)
xprop -id $id -f _SCRATCH_VISIBILITY 8i -set _SCRATCH_VISIBILITY 0
xdotool windowunmap $id
fi
fi
}

switch_app() {
id=$(bspc query -N -n "focused")
if [ $(xprop -id "$id" | grep "_SCRATCH_VISIBILITY(INTEGER) = 1" | wc -l) -gt 0 ]; then
xprop -id $id -f _SCRATCH_VISIBILITY 8i -set _SCRATCH_VISIBILITY 0
xdotool windowunmap $id
fi

sid=$(
id=$(bspc query -N -n "focused");
for w in $(xwininfo -root -children | grep -e "^\s*0x[0-9a-f]\+" -o); do
if [ "$w" != "$id" ]; then
t=$(xprop -id $w _SCRATCH_ORDER | grep ' = \(.*\)')
if [ -n "$t" ]; then
echo $t $w
fi
fi
done | sort -n | head -n1 | cut -d" " -f 5
);

if [ -n "$sid" ] && [ "$(printf "%04d" $sid)" != "$(printf "%04d" $id)" ]; then
echo "$sid" != "$id"
xprop -id $sid -f _SCRATCH_ORDER 32ii -set _SCRATCH_ORDER $(date +%s,%N)
xprop -id $sid -f _SCRATCH_VISIBILITY 8i -set _SCRATCH_VISIBILITY 1
xdotool windowmap $sid
bspc node -f $sid
fi
}


op="$1"
if [ "$op" = "toggle-flag" ]; then
toggle_flag
elif [ "$op" = "switch-app" ]; then
switch_app
fi

```

And add this line to your `~/.config/sxhkd/sxhkdrc`:

```
# Push focused window to scratchpad (background)

super + shift + i
"$HOME"/.config/bspwm/scratchpad.sh toggle-flag

# Hide/Un-Hide a window pushed to scratchpad previously

super + i
"$HOME"/.config/bspwm/scratchpad.sh switch-app
```

Now you can use `Super + Shift + i` to hide the focused window and `Super + i`
to get it back.

## Misc settings

#### Borders

There are active, normal, focused window colors settings available:

```bash

$ cat ~/.config/bspwm/bspwmrc
...
# Colors

dark_moderate_blue="#5e81ac"
pure_cyan="#00FFFF"
pure_magenta="#FF00FF"
vivid_red="#ff3232"
hot_pink="#ff69b4"
up_maroon="#7b1113"



# Feedback color of preselection

bspc config presel_feedback_color   $up_maroon

# Focused Border color

bspc config focused_border_color    $hot_pink

# Active border color

bspc config active_border_color     $pure_magenta

# Normal border color

bspc config normal_border_color     $pure_cyan

...
```
#### Mouse

While you press and hold _SUPER_ key and hit these mouse buttons, these actions can be done:

```bash
$ vi ~/.config/bspwm/bspwmrc
...
# Pointer actions when pressing mod + button

bspc config pointer_action1         move
bspc config pointer_action2         resize_side
bspc config pointer_action3         resize_corner
...
:wq!
```

#### Focus

When you move your mouse to some window, it should get focused. This behaviour is disabled by default which I use mostly and found helpful. Enable it by appending this line to your _bspwmrc_:

```bash
$ bspc config focus_follows_pointer true

```

#### No borders

If you have only one window open on a desktop, you might not want it to have
borders. Append it to _bspwmrc_:

```bash
$ bspc config borderless_monocle true
```

#### Split ratio
How much area the new window should take? You can configure this behaviour using
this command or by appending it to _bspwmrc_:

```sh
bspc config split_ratio 0.50
```
It will alot half of the available screen to new window.

#### EWMH

Ignore EWMH focus requests. If true, opening new program in already opened instance will have direct focus too. Like if you're on desktop 8 and you open a URL from mutt, and chrome is configured as url launcher, it will send the url to chrome opened
in 2nd desktop and switch to it.

```bash
bspc config ignore_ewmh_focus false
```

I think its enough for now. _BSPWM_ is amazing and very useful if you know
scripting. If need assistance on _BSPWM_, you can always ask in comments.
Thanks for reading. :wink:

Here is a demonstration video.

{{< youtube Y_aX-TOPREc >}}
