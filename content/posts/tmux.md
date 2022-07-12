---
title: "TMUX"
date: 2020-06-06T18:13:35+05:00
author: "Abdullah Khabir"
tags: ['tmux', 'screen', 'multiplexer', 'console']
comments: true
toc: true
description: "A terminal multiplexer"
layout: post
url: tmux
featuredImage: "/images/tmux.jpeg"
---

# TMUX

_tmux_ is a terminal multiplexer. You can run programs inside a tmux session,
detach session and continue running programs in background, reattach later.

### Installation

_tmux_ is available in all linux distributions. You can install it using your
distribution's package manager. In *Arch Linux*:

```bash
$ sudo pacman -S tmux
```

### Start

You can start _tmux_ by invoking `tmux` command inside your terminal.

### Keybindings

The default modifier key is `Ctrl + b` followed by a key. Press `Ctrl + b` and
then hit another key and tmux will get it.

You can change the default keybindings in `~/.tmux.conf`.

```bash

$ vi ~/.tmux.conf

...

unbind C-b
set option -g prefix `
...
:wq
```
Here I have removed the default prefix and have bounded "`" as prefix.
I found it useful than default prefix.

### Detach session

You can detach a _tmux session_ by sending it `Prefix` followed by `d`.


### Re attach session

You can reattach to a running  _tmux session_ by simply invoking `tmux
attach-session -t <target_session>`. You can get session's name using `tmux ls`.

###  Windows

By default, _tmux_ will start a new window running a shell inside it.
You can create new windows by pressing `Prefix` followed by `c`.

You can go to next window by pressing `Prefix` followed by `n`.

Or you can hit `Prefix` followed by `w` and tmux will show you windows opened
and you can select which window you want to go to.

To kill a window, go to the window and hit `Prefix` followed by `x`.

### Panes

A window can have multiple panes.

To split current window into two panes horizontally, hit `Prefix` followed by `%`.
To split current window into two panes vertically, hit `Prefix` followed by `"`.
To go to next pane, hit `Prefix` followed by `o`.
To toggle between panes, hit `Prefix` followed by `;`.
To kill a pane you're inside, hit `Prefix` followed by `x`.

### My tmux.conf

Below is my customized _tmux.conf_. You can copy and then customize it to your
needs, its well documented with comments.

```bash
$ cat ~/.tmux.conf


#  ██████████ ████     ████ ██     ██ ██     ██
# ░░░░░██░░░ ░██░██   ██░██░██    ░██░░██   ██
#     ░██    ░██░░██ ██ ░██░██    ░██ ░░██ ██
#     ░██    ░██ ░░███  ░██░██    ░██  ░░███
#     ░██    ░██  ░░█   ░██░██    ░██   ██░██
#     ░██    ░██   ░    ░██░██    ░██  ██ ░░██
#     ░██    ░██        ░██░░███████  ██   ░░██
#     ░░     ░░         ░░  ░░░░░░░  ░░     ░░
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ Author ▓ AK <abdullah@abdullah.today>
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░

# source powerline
source /usr/lib/python3.8/site-packages/powerline/bindings/tmux/powerline.conf

# Custom Prefix
unbind C-b
set-option -g prefix `
bind ` send-prefix

# Shell
set -g default-command /bin/zsh
set -g default-shell /bin/zsh

# utf-8 support in status bar
#set -g status-utf8 on

# Reload the config
bind r source-file ~/.tmux.conf \; display "~/.tmux.conf reloaded"

# Synchronize panes
bind e setw synchronize-panes \; display "synchronize mode"

# Splits
unbind %
unbind '"'
bind h split-window -v
bind v split-window -h
#bind -n M-h send-keys

# enable vi-mode
setw -g mode-keys vi
set -g status-keys vi

# copy paste
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

# command mode
bind : command-prompt

# Kill panes
bind x kill-pane

# Status on off key
bind t set status

# Lock the tty

bind b run-shell "$HOME/.local/bin/unilock"

# Alerts
setw -g monitor-activity on
set -g visual-activity on

# Enable mouse mode
setw -g mouse on

# Default terminal mode
set -g default-terminal 'screen-256color'

# Status and colors
set -g status-justify left
set -g status-interval 2
set -g status-bg colour25
set -g status-fg colour222

# Window status
set-option -g status-position bottom
setw -g window-status-format "#[bg=colour246, fg=colour14, bold] #W "
setw -g window-status-current-format "#[bg=colour25, fg=colour14, bold] #W "

# Right status
set -g status-right-length 100
set -g status-right  '#(~/.local/bin/tmux-status)'
set -g status-left-length 50
set -g status-left ''

# Visuals
setw -g monitor-activity on
set-option -g bell-action none
set-option -g visual-activity on
set-option -g visual-bell off
set-option -g visual-silence off

# clock
set -g clock-mode-colour colour20

# urlview
run-shell $HOME/.local/bin/tmux.urlview

# resize panes
setw -g aggressive-resize on

# No delay
set -sg escape-time 0

# History
set -g history-limit 10000

# Scrolling
set-option -g terminal-overrides 'xterm*:smcup@:rmcup@'

# Panes index
set -g pane-base-index 1
set -g renumber-windows on

# Windows index
set -g base-index 1

# Layouts
bind Z previous-layout
bind X next-layout

# Detach others
bind D detach -a

# Navigate and resize splits
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind -n M-h if-shell "$is_vim" "send-keys M-h" "resize-pane -L 2"
bind -n M-l if-shell "$is_vim" "send-keys M-l" "resize-pane -R 2"
bind -n M-k if-shell "$is_vim" "send-keys M-k" "resize-pane -U 2"
bind -n M-j if-shell "$is_vim" "send-keys M-j" "resize-pane -D 2"

```

### Auto start tmux on boot

I have these lines in my shell startup file `~/.zprofile`.

```bash
$ cat ~/.zprofile

#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ Author ▓ Abdullah <https://abdullah.today/>
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░


# Start X at login


if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx -- vt1 -keeptty &>/dev/null
  logout
elif [[ $(tty) != /dev/tty1 ]]; then
  sudo loadkeys $HOME/.loadkeysrc
  tmux has-session -t $USER || tmux new-session -t $USER && tmux attach-session -t $USER
fi

```
So if I login from other than tty1, and if there is an already running _tmux
session_, it attaches me to it. Else starts a new session and get me there.
:wink:
Here is a demonstration video.

{{< youtube uiSUJP8Xv5A >}}
