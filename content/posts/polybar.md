---
author: "Abdullah Khabir"
layout: post
date: 2019-10-12
title: "Polybar - A stylish bar"
url: polybar
comments: true
tags:
  - polybar
  - bspwm
  - status_bar
description: "Polybar - A stylish bar"
---

I recently tried to compile [polybar](https://github.com/polybar/polybar.git) and used it with tiling window manager [bspwm](https://github.com/baskerville/bspwm.git). 


## Polybar  

Here is my bar configuration I have been using for over the years with i3,
bspwm, dwm and many other window managers even with xfce4.


```
$ cat $HOME/.config/polybar/config
[colors]
background = #FF000000
background-alt = ${xrdb:polybar*color8}
foreground = ${xrdb:polybar*foreground}
urgent = #B34747
foreground-alt = #555
primary = ${xrdb:polybar*color3}
secondary = ${xrdb:polybar*color1}
alert = ${xrdb:polybar*color13}


[settings]
screenchange-reload = true
screenchange = true
throttle-output = 5
throttle-output-for = 10
throttle-input-for = 30
compositing-background = source
compositing-foreground = over
compositing-overline = over
compositing-underline = over
compositing-border = over
pseudo-transparency = true


[global/wm]
margin-top = 0
margin-bottom = 0


[bar/eDP-1]
monitor = ${env:MONITOR:eDP-1}
monitor-fallback = eDP1
bottom = false
width = 100%
height = 25
offset-x = 0
offset-y = 0
radius = 10
fixed-center = true
background = ${colors.background}
foreground = ${colors.foreground}
line-size = 0
line-color = #f00
border-size = 0
border-top-size = 0
border-color = ${xrdb:background}
padding-left = 0
padding-right = 1
module-margin-left = 2
module-margin-right = 2
font-0 =  FontAwesome
font-1 = Monospace:weight=regular:pixelsize=13
font-2 = DejaVu Sans:pixelsize=11
font-3 =  Segoe UI Emoji
modules-right = bspwm
modules-center = mpd
modules-left = date hijri wlan battery temperature cpu memory pulseaudio arch_backlight
tray-position = right
tray-padding = 6
;tray-background = #24292A00
tray-background = ${root.background}
wm-restack = bspwm
override-redirect = false
;scroll-up = bspwm-desknext
;scroll-down = bspwm-deskprev


[module/bspwm]
type = internal/bspwm
pin-workspaces = true
inline-mode = false
enable-click = true
enable-scroll = true
reverse-scroll = true
fuzzy-match = false
ws-icon-0 = "I"
ws-icon-1 = "II"
ws-icon-2 = "III"
ws-icon-3 = "IV"
ws-icon-4 = "V"
ws-icon-5 = "VI"
ws-icon-6 = "VII"
ws-icon-7 = "VIII"
ws-icon-8 = "IX"
ws-icon-9 = "X"
format = <label-state> <label-mode>
label-monitor = %name%
label-dimmed-foreground = #555
;label-dimmed-focused-background = #f00
label-focused = %icon% %name%
label-focused-underline= ${colors.primary}
label-focused-foreground = #f00000
label-occupied = %icon% %name%
label-occupied-underline = #555555
label-urgent = %icon% %name%
label-urgent-underline = ${colors.primary}
label-urgent-background = ${colors.alert}
label-empty = %icon% %name%
label-empty-foreground = #d700ff
;label-empty-foreground = ${colors.foreground-alt}
label-monocle = "  "
label-monocle-foreground = #fff995
label-tiled = "  "
;label-tiled-foreground = #750080
label-tiled-foreground = #00ffff
label-fullscreen = "  "
;label-floating = "  "
label-floating = "  "
label-floating-foreground = #ff45ff
label-pseudotiled = "  "
label-locked = "  "
label-locked-foreground = #bd2c40
label-sticky = "  "
label-sticky-foreground = #fba922
label-private = "     "
label-private-foreground = #bd2c40
label-marked = " "
label-marked-foreground = #0000ff
label-separator = 
label-separator-padding = 3
label-separator-foreground = #ffb52a
label-occupied-padding = 3
label-empty-padding = 3
label-urgent-padding = 3



[module/xwindow]
type = internal/xwindow
label = "    /  %title:0:48:...%"


[module/backlight-acpi]
type = internal/backlight
sub = module/backlight-acpi
base = module/xbacklight
inherit = module/xbacklight
card = intel_backlight
format = <ramp><label>
label = %percentage%%
ramp-0 = 🌕
ramp-1 = 🌔
ramp-2 = 🌓
ramp-3 = 🌒
ramp-4 = 🌑


;[module/backlight]
;type = internal/backlight
;card = intel_backlight
;;output = eDP-1
;format = <ramp><label>
;label = %percentage%%
;label-foreground = #3EC13F
;format-padding = 1
;ramp-0 = 🌕
;ramp-1 = 🌔
;ramp-2 = 🌓
;ramp-3 = 🌒
;ramp-4 = 🌑
;enable-scroll = true
;scroll-up = exec light -A 5
;scroll-down = exec light -U 6
;

[module/pavolume]
type = custom/script
tail = true
label = %output%
label-foreground = #D1FF00
exec = ~/.config/polybar/scripts/pavolume.sh --listen
click-right = exec pavucontrol
scroll-up = ~/.config/polybar/scripts/pavolume.sh --up
scroll-down = ~/.config/polybar/scripts/pavolume.sh --down
format-underline = #3EC13F
format-foreground = ${colors.foreground}
format-background = ${colors.background}


[module/xworkspaces]
type = internal/xworkspaces
pin-workspaces = true
; Create click handler used to focus desktop
enable-click = true
index-sort = true
wrapping-scroll = false
#ws-num = 9
icon-0 = code;♚
icon-1 = office;♛
icon-2 = graphics;♜
icon-3 = mail;♝
icon-4 = web;♞
icon-default = ♟
show-all = true
label-empty-foreground =  ${colors.foreground-alt}
#label-empty = %icon%
label-mode-padding = 3
label-mode-foreground = ${colors.background}
label-mode-background = #a8df5a
label-focused = %icon%
label-focused-background = ${module/bspwm.label-focused-background}
label-focused-underline = ${module/bspwm.label-focused-underline}
label-focused-padding = ${module/bspwm.label-focused-padding}
label-unfocused = %icon%
label-unfocused-padding = ${module/bspwm.label-occupied-padding}
; visible = Active workspace on unfocused monitor
label-visible = %icon%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}
; urgent = Workspace with urgency hint set
label-urgent-foreground = ${xrdb:polybar*color8}
label-urgent-background = ${module/bspwm.label-urgent-background}
label-urgent-padding = ${module/bspwm.label-urgent-padding}
; Create scroll handlers used to cycle desktops
enable-scroll = true
label-monitor = %name%
format = <label-state>
label-active = %icon% %name%
label-active-foreground = #ffffff
#label-active-background = #3f3f3f
label-active-underline = #fba922
label-occupied = %icon%
label-occupied-underline = #555555
label-urgent = %icon%
#label-empty = %icon%
#label-empty-foreground = #55



[module/wlan]
type = internal/network
interface = wlp3s0
#interval = 3.0
tail = true
format-connected = <ramp-signal> <label-connected>
format-connected-underline = #9f78e1
label-connected =  %essid%%{A}
label-connected-foreground = ${xrdb:polybar.color16}
label-disconnected = 
format-disconnected = <label-disconnected>
ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 
;ramp-signal-0 = 😱
;ramp-signal-1 = 😠
;ramp-signal-2 = 😒
;ramp-signal-3 = 😊
;ramp-signal-4 = 😃
;ramp-signal-5 = 😈

;label-connected = %essid%
;format-disconnected = <label-disconnected>
;label-disconnected =   Disconnected
label-disconnected-foreground = ${colors.foreground-alt}
format-packetloss = <animation-packetloss> <label-connected>
animation-packetloss-0 = ⚠
animation-packetloss-0-foreground = #ffa64c
animation-packetloss-1 = 📶
animation-packetloss-1-foreground = #000000
; Framerate in milliseconds
animation-packetloss-framerate = 500
label-packetloss = %essid%
label-packetloss-foreground = #eefafafa
;ramp-signal-0 =  
;ramp-signal-1 =  
;ramp-signal-2 =  
;ramp-signal-3 =  
;ramp-signal-4 =  
;ramp-signal-5 =  

ramp-signal-foreground = ${colors.foreground-alt}


[module/xbacklight]
type = internal/xbacklight
format = <label> <bar>
bar-width = 10
bar-indicator =  
bar-indicator-foreground = #fff
bar-empty = 
bar-fill = 
format-prefix = " "
label-foreground = #3EC13F
format-padding = 1


[module/cpu]
type = internal/cpu
interval = 2
format-prefix = "cpu "
format-prefix-foreground = ${xrdb:polybar.color3}
format-underline = #f90000
label = %percentage%%
label-foreground = ${xrdb:polybar.color16}


[module/memory]
type = internal/memory
interval = 2
format-prefix = "mem "
format-prefix-foreground = ${xrdb:polybar.color2}
format-underline = #4bffdc
label = %percentage_used%%
label-foreground = ${xrdb:polybar.color12}


[module/date]
type = internal/date
interval = 1
date = " %a %d %b -"
date-alt = " %d %b -"
time = %H:%M
time-alt = %H:%M:%S
format-prefix = " "
;format-prefix = "🕓"
format-prefix-foreground = ${xrdb:polybar*color5}
format-underline = #0a6cf5
;label = %date% %time%
label = %time%
label-foreground = #9A32DB

[module/time]
type = custom/script
exec = ~/.config/polybar/scripts/time.py
format-prefix = " "
format-prefix-foreground = ${xrdb:polybar*color4}
format-underline = #0a6cf5

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC0
full-at = 100
poll-interval = 5
time-format = %H:%M
format-charging = <animation-charging> <label-charging>
format-charging-underline = #ffb52a
label-charging =  %percentage%% %time%
label-charging-foreground = ${xrdb:polybar.color9}
format-discharging = <ramp-capacity> <label-discharging>
format-discharging-underline = ${self.format-charging-underline}
label-discharging = %percentage%% %time%
label-discharging-foreground = ${xrdb:polybar.color9}
format-full = <ramp-capacity> <label-full>
format-full-prefix = " "
format-full-prefix-foreground = ${xrdb:polybar.color1}
format-full-underline = ${self.format-charging-underline}
;label-full = %percentage%% - fully charged!
ramp-capacity-0 = " "
ramp-capacity-1 = " "
ramp-capacity-2 = " "
ramp-capacity-3 = " "
ramp-capacity-4 = " "
ramp-capacity-foreground = ${colors.foreground-alt}
animation-charging-0 = "  "
animation-charging-1 = "  "
animation-charging-2 = "  "
animation-charging-3 = "  "
animation-charging-4 = "  "
animation-charging-foreground = ${colors.foreground}
animation-charging-framerate = 750

[module/battery2]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 95

format-charging = "<animation-charging><label-charging>"
;format-charging-underline = ${colors.foreground}
label-charging = %percentage%% - time left %time%
label-charging-foreground = ${colors.foreground}
label-charging-background = ${colors.background}

format-discharging = "<ramp-capacity><label-discharging>"
;format-discharging-underline = ${self.format-charging-underline}
label-discharging = %percentage%% - time left %time%
label-discharging-foreground = ${colors.foreground}
label-discharging-background = ${colors.background}

format-full-prefix = "  "
format-full-prefix-foreground = ${colors.foreground}
format-full-prefix-background = ${colors.background}
;format-full-underline = ${self.format-charging-underline}

ramp-capacity-0 = "  "
ramp-capacity-0-foreground = ${colors.alert}
ramp-capacity-1 = "  "
ramp-capacity-2 = "  "
ramp-capacity-3 = "  "
ramp-capacity-foreground = ${colors.foreground}
ramp-capacity-background = ${colors.background}

animation-charging-0 = "  "
animation-charging-1 = "  "
animation-charging-2 = "  "
animation-charging-3 = "  "
animation-charging-foreground = ${colors.foreground}
animation-charging-background = ${colors.background}
animation-charging-framerate = 750


[module/mpd]
type = internal/mpd
format-online = "<label-song> <label-time> <icon-prev> <icon-stop> <toggle> <icon-next>"
format-underline = #FF00DB
format-prefix-foreground = #00A5FF
icon-prev = 
icon-stop = 
icon-play-prefix = #f00
icon-play = 
icon-pause = 
icon-next = 
label-song = %title%
label-song-foreground = #00A5FF
label-song-maxlen = 40
label-song-ellipsis = true
bar-progress-width = 10
bar-progress-indicator = 
bar-progress-fill = 
bar-progress-empty = 
bar-progress-fill-foreground = #ff0
bar-progress-fill-background = ${colors.background}
bar-progress-indicator-foreground = ${colors.foreground}
;format-online-foreground = ${colors.foreground}
;format-online-background = ${colors.background}
label-time-foreground = #ff0

[module/gmail]
type = custom/script
#exec = python3 ~/.config/polybar/gmail/run.py 2>/dev/null
#exec = ping -c 1 google.com 2&>/dev/null && python3 ~/.config/polybar/gmail/run.py || echo 'no network'
exec = ~/bin/gmailScript4Polybar 
tail = true
click-right= /usr/bin/google-chrome-stable https://mail.google.com
click-left= urxvtc -e mutg
;format-background = #00A5FF
;format-underline = #FF00DB

[module/abdullah]
type = custom/script
exec = python3 ~/.config/polybar/abdullah/inbox.py 
tail = true
interval = 60
click-right= google-chrome https://mail.google.com
click-left= urxvtc -e mutt -F ~/.config/mutt/muttrc
;format-background = #00A5FF
;format-underline = #FF00DB

[module/mail]
type = custom/script
#exec = python3 ~/.config/polybar/theak/myinbox.py 2>/dev/null
#exec = python3 ~/.config/polybar/theak/networktheak.py
tail = true
#exec = "if ping -c 1 google.com &> /dev/null \
#then python3 ~/.config/polybar/theak/myinbox.py \
#else \
#  echo "no network"
#  fi"
#exec = "ping -c 1 theak.me \&> /dev/null && python3 ~/.config/polybar/theak/myinbox.py || echo "
exec = ping -c 1 theak.me \&> /dev/null \&& python3 ~/.config/polybar/theak/myinbox.py || echo 'no network'
#click-right= qutebrowser https://mail.theak.me
click-left= urxvtc -e mutt 
#format-background = #00A5FF
format-underline = #FF00DB


[module/music]
type = custom/script
exec = mpc current | skroll -l
tail = true


[module/mpd1]
type = custom/script
exec = ~/.config/polybar/scripts/mpd.sh
tail = true
format-foreground = ${colors.foreground}
format-underline = #FF00DB
format-prefix-foreground = #00A5FF
format-background = ${colors.background}
click-left = exec smus
click-right = mpc pause & pkill -F /tmp/smus.pid


[module/bluetooth]
type = custom/script
exec = ~/.config/polybar/scripts/isactive-bluetooth.sh
tail = true
;format-foreground = ${colors.foreground}
format-underline = #FF00DB
format-background = ${colors.background}
format-prefix = ""


[module/menu]
type = custom/menu
label-open = 
label-open-foreground = ${colors.secondary}
label-close =  cancel
label-close-foreground = ${xrdb:polybar*color9}
label-separator = |
label-separator-foreground = ${colors.foreground-alt}
format-spacing = 1
;label-open = "  "
;label-open-foreground = ${colors.foreground}
;label-close = "  "
;label-close-foreground = ${colors.foreground}
;label-separator = "│"
;label-separator-foreground = ${colors.foreground-alt}
menu-0-0 = Top
menu-0-0-exec = menu-open-1
menu-0-1 = Extra
menu-0-1-exec = menu-open-2
menu-0-2 = Music
menu-0-2-exec = menu-open-3
menu-0-3 = Power
menu-0-3-exec = menu-open-4
menu-1-0 = "  "
menu-1-0-exec = qutebrowser
menu-1-1 = "  "
menu-1-1-exec = urxvt
menu-1-2 = "  "
menu-1-2-exec = urxvtc -e ranger
menu-1-3 = "  "
menu-1-3-exec = subl3
menu-2-0 = "  "
menu-2-0-exec = gimp-2.8
menu-2-1 = "  "
menu-2-1-exec = spotify --force-device-scale-factor=1.5
menu-2-2 = "  "
menu-2-2-exec = deluge
menu-2-3 = "  "
menu-2-3-exec = claws-mail
menu-2-4 = "  "
menu-2-4-exec = steam-runtime
menu-2-5 = "  "
menu-2-5-exec = scrot %F-%S_$wx$h_scrot.png -e 'mv $f /tmp/foo.png'
menu-3-0 = "  "
menu-3-0-exec = $HOME/bin/smus
menu-3-1 = "  "
menu-3-1-exec = mpc prev
menu-3-2 = "  "
menu-3-2-exec = mpc stop 
menu-3-3 = "  "
menu-3-3-exec = mpc pause 
menu-3-4 = "  "
menu-3-4-exec = mpc next
menu-4-0 = "  "
menu-4-0-exec = lock
menu-4-1 = "  "
menu-4-1-exec = systemctl reboot
menu-4-2 = "  "
menu-4-2-exec = systemctl poweroff


[module/arch_backlight]
type = custom/script
exec = ~/.config/polybar/scripts/backlight.sh
tail = true
scroll-up = exec light -A 5
scroll-down = exec light -U 5
format-prefix = " "
label = %output%%
label-foreground = #3EC13F
format-padding = 1

[module/backlight]
type = internal/backlight
card = intel_backlight
exec = light | cut -d . -f1
format = <label>
;tail = true
;interval = 0.2
label = %percentage%%
enable-scroll = true
scroll-up = exec /usr/sbin/light -A 5
scroll-down = exec /usr/sbin/light -U 5
format-prefix = " "
;label = %output%%
label-foreground = #3EC13F
format-padding = 1



[module/mpd-new]
type = internal/mpd
format-online = <label-song> <icon-prev> <toggle> <icon-next> <icon-random>  <icon-repeat> <label-time> 
format-offline = <label-offline>
label-offline =  no music
icon-prev = 
icon-stop = o
icon-play = 
icon-pause = 
icon-next = 
icon-seekf = >>
icon-random = 
icon-repeat = 
label-song = 𝄞 %title% - %artist% 
label-song-maxlen = 25
label-song-ellipsis = true
toggle-on-foreground = #e60053
toggle-off-foreground = #66


[module/pulseaudio]
type = internal/pulseaudio
sink = alsa_output.pci-0000_00_1b.0.analog-stereo
use-ui-max = true
format-volume = <ramp-volume><label-volume> 
label-volume =  %percentage%%
label-volume-foreground = ${xrdb:polybar.color13}
label-muted = 🔇 
label-muted-foreground = #
label-active-font = 4
bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = true
bar-volume-indicator = 
bar-volume-indicator-font = 2
bar-volume-fill = 
bar-volume-fill-font = 2
bar-volume-empty = 
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}
ramp-volume-0 = 🔈
ramp-volume-1 = 🔉
ramp-volume-2 = 🔊

[module/mic]
type = internal/pulseaudio
sink = alsa_input.pci-0000_00_1b.0.analog-stereo
format-volume = <label-volume> <bar-volume>
label-volume =  %percentage%%
label-volume-foreground = ${root.foreground}
label-muted = 🔇 muted
label-muted-foreground = #666
bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = 
bar-volume-indicator-font = 2
bar-volume-fill = 
bar-volume-fill-font = 2
bar-volume-empty = 
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}


[module/tags]
type = internal/xworkspaces
label-active = %name%
label-active-padding = 2
label-active-background = ${colors.background}
label-active-foreground = ${colors.foreground}
label-occupied = %name%
label-occupied-background = #ff0000
label-empty = %name%
label-empty-padding = 2
label-urgent = %name%
label-urgent-padding = 2
label-urgent-background = ${colors.background}
label-urgent-foreground = ${colors.foreground}


[module/temperature]
type = internal/temperature
interval = 3
thermal-zone = 0
warn-temperature = 70
format = <ramp><label>
format-padding = 1
;label = %{A1:termite --exec='watch sensors' & disown:} %temperature%%{A}
label-foreground = ${xrdb:polybar.color11}
ramp-0 = ""
ramp-0-foreground = ${xrdb:polybar*color4}
ramp-1 = ""
ramp-1-foreground = ${xrdb:polybar*color16}
ramp-2 = ""
ramp-2-foreground = ${xrdb:polybar*color17}
ramp-3 = ""
ramp-3-foreground = ${xrdb:polybar*urgent}
format-warn = <label-warn>
label-warn = " %temperature-c%"
label-warn-padding = 1
label-warn-foreground = ${xrdb:polybar.urgent}


[module/window_switch]
type = custom/script
interval = 5
label = "%{A1:skippy-xd:} %{A3:skippy-xd:} %output% %{A} %{A}"
exec = echo ""
format = <label>

[module/hijri]
type = custom/script
#exec = "python -c 'from ummalqura.hijri_date import HijriDate; from datetime import date; print(HijriDate.get_hijri_date(date.today()))'"
exec = ~/.config/polybar/scripts/hijri.py
tail = false
interval = 180
label-foreground = ${xrdb:polybar.color5}


[bar/dwm]
inherit = settings
background = ${colors.background}
foreground = ${colors.foreground}
override-redirect = true
;width = 55%
;height = 26
;offset-x = 45%
modules-left = date wlan memory cpu pulseaudio backlight-acpi battery 
modules-right = mpd-new
modules-center = window_switch
font-0 =  Segoe UI Emoji
font-1 = DejaVu Sans:pixelsize=11
bottom = true
width = 100%
height = 20
;offset-x = 1%
offset-y = -1
radius = 0
fixed-center = true
line-size = 0
line-color = #f00
border-size = 0
border-color = #00000000
padding-left = 0
padding-right = 1
module-margin-left = 2
module-margin-right = 2


[bar/HDMI-2]
inherit = bar/eDP-1
monitor = HDMI-2



[bar/XWAYLAND0]
inherit = bar/eDP-1
monitor = XWAYLAND0

; vim:ft=dosini

```

# BSPWM  

>  **_UPDATE:_** Here is a [post](https://abdullah.today/bspwm) for BSPWM.

bspwm is a tiling window manager, it uses `sxhkd` for keybindings and windows
management keybindings. Here is both configurations for both programs. You can use `xbindkeys` there...

```
$ cat $HOME/.config/bspwm/bspwrc

#! /bin/sh

sxhkd &
xsetroot -cursor_name left_ptr
$HOME/.config/bspwm/autostart.sh &

bspc monitor -d I II III IV V VI VII VIII IX X

bspc config border_width         2
bspc config window_gap           7
bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true
bspc config top_padding	       	 0
bspc config split_ratio          0.50
bspc config borderless_monocle   true
bspc config gapless_monocle      true
bspc config focus_follows_pointer true
bspc config click_to_focus        true
bspc config focus_by_distance     true
bspc config history_aware_focus   true
bspc config single_monocle        false
bspc config normal_border_color   "#4c566a"
bspc config focused_border_color  "#5e81ac"
bspc config presel_feedback_color "#5e81ac"

bspc rule -a Sxiv state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
#bspc rule -a URxvt follow=on focus=on
bspc rule -a feh state=floating follow=on
bspc rule -a Gpicview state=floating follow=on
bspc rule -a Pavucontrol state=floating follow=on
bspc rule -a mpv state=floating sticky=on
bspc rule -a feh state=floating
bspc rule -a Nitrogen state=floating
bspc rule -a Arandr state=floating
bspc rule -a Galculator state=floating
bspc rule -a Font-manager state=floating
bspc rule -a Oblogout state=floating
#bspc rule -a Peek state=floating
#bspc rule -a Skype state=floating
#bspc rule -a Pavucontrol state=floating sticky=on
#bspc rule -a Xfce4-appfinder  state=floating sticky=on
#bspc rule -a Gpick state=floating sticky=on


# Colors
bspc config focused_border_color "#d8dee8"
bspc config normal_border_color "#2f343f"

# Scratchpad 
bspc rule title=scratchpad class=scratchpad sticky=on state=floating hidden=on
urxvtc -name scratchpad -geometry 75x20 &
```

## SXHKD

```
cat $HOME/.config/sxhkd/sxhkdrc

#!/bin/sh

# Reload functions
#super + Escape
#	"$XDG_CONFIG_HOME"/sxhkd/functions

# Reload sxhkd
super + Escape
  pkill -USR1 -x sxhkd

# Exit bspwm
super + shift + q
  bspc quit

# Alternate between the tiled and monocle layout
super + t
	bspc desktop -l next

# Swap the current node and the biggest node
super + g
	bspc node -s biggest

# Kill a window
super + q
  bspc node -c

# Scratchpad
super + i
  ~/.local/bin/scratchtoggle

super + Return
  urxvtc

Alt + Return
  termite

super + d
  dmenu_run

super + {h,j,k,l}
	bspc node -f {west,south,north,east}

super + w
  $BROWSER

super + alt + {0-9}
	mpc -q seek {0-9}0%

super + {_,alt + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}

#XF86Audio{RaiseVolume,LowerVolume,Mute}
#	amixer {-q set Master 5%+,-q set Master 5%-,set Master toggle}

# set the window state
super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# set the node flags
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

# Music
XF86LaunchA
  mpc toggle

#
# focus/swap
#

# focus the node in the given direction
#super + {_,shift + }{h,j,k,l}
#	bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# focus the next/previous node in the current desktop
super + {_,shift + }c
	bspc node -f {next,prev}.local

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {Tab,semicolon}
	bspc {node,desktop} -f next

# focus the older or newer node in the focus history
super + {o,i}
	bspc wm -h off; \
	bspc node {older,newer} -f; \
	bspc wm -h on

# focus or send to the given desktop
super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

#
# preselect
#

# preselect the direction
super + ctrl + {h,j,k,l}
	bspc node -p {west,south,north,east}

# preselect the ratio
super + ctrl + {1-9}
	bspc node -o 0.{1-9}

# cancel the preselection for the focused node
super + ctrl + space
	bspc node -p cancel

# cancel the preselection for the focused desktop
super + ctrl + shift + space
	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

#
# move/resize
#

# expand a window by moving one of its side outward
super + shift + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

# contract a window by moving one of its side inward
super + alt + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# move a floating window
super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}





############################################################################ 
#                                        ▗▄▖       ▗▖                      # 
#                                        ▝▜▌       ▐▌                      # 
#     ▐▙█▙  ▟█▙  █▟█▌▗▟██▖ ▟█▙ ▐▙██▖ ▟██▖ ▐▌       ▐▌▟▛  ▟█▙ ▝█ █▌▗▟██▖    # 
#     ▐▛ ▜▌▐▙▄▟▌ █▘  ▐▙▄▖▘▐▛ ▜▌▐▛ ▐▌ ▘▄▟▌ ▐▌       ▐▙█  ▐▙▄▟▌ █▖█ ▐▙▄▖▘    # 
#     ▐▌ ▐▌▐▛▀▀▘ █    ▀▀█▖▐▌ ▐▌▐▌ ▐▌▗█▀▜▌ ▐▌       ▐▛█▖ ▐▛▀▀▘ ▐█▛  ▀▀█▖    # 
#     ▐█▄█▘▝█▄▄▌ █   ▐▄▄▟▌▝█▄█▘▐▌ ▐▌▐▙▄█▌ ▐▙▄      ▐▌▝▙ ▝█▄▄▌  █▌ ▐▄▄▟▌    # 
#     ▐▌▀▘  ▝▀▀  ▀    ▀▀▀  ▝▀▘ ▝▘ ▝▘ ▀▀▝▘  ▀▀      ▝▘ ▀▘ ▝▀▀   █   ▀▀▀     # 
#     ▐▌                                                      █▌           # 
############################################################################ 

# Brightness keys
XF86MonBrightnessDown
  xbacklight -5

XF86MonBrightnessUp
  xbacklight +5

# Raise Volume
XF86AudioRaiseVolume
        amixer set Master 10%+


# Lower Volume
XF86AudioLowerVolume
        amixer set Master 10%-

# Mute 
XF86AudioMute
        amixer -D pulse set Master 1+ toggle

# Screenshot
Print
    import -window root /tmp/foo.png; cat /tmp/foo.png | xclip -selection clipboard -t image/png

# File Manager
XF86Explorer
    urxvtc -e ranger

## Mouse buttons
#super + button{1-3}
#   bspc pointer -g {move,resize_side,resize_corner}
#
#super + !button{1-3}
#   bspc pointer -t %i %i
#
#super + @button{1-3}
#   bspc pointer -u
#

# Music little backward/forward
alt + bracket{left,right}
  mpc seek {-10,+10}

# Music backward/forward
alt + shift + bracket{left,right}
  mpc seek {-120,+120}
 
# Lock the screen
super + x
  slock

# vim:ft=sxhkdrc
```

I hope you will get a working desktop experience with these configurations. It's easy to manipulate them to your needs.

Here is a demonstration video.

{{< youtube 9iKVKyaUayc >}}
