---
author: "Abdullah Khabir"
title: Terminal Sharing service
description: Terminal Sharing service
url: tmate
date: 2020-05-17
comments: true
layout: post
toc: true
tags: [ tmate, terminal sharing, remote, rdp, tmux ]
keywords: ["tmate", "screen sharing", "terminal sharing", "exit tmate", "tmate lost server", "tmate alternative", "tmate vs tmux", "tmate centos", "tmate web", "tmate github", "tmate security", "tmate scroll up", "tmate no current client", "tmate: unknown option -- f", "uninstall tmate", "tmate -f not working", "tmate invalid session token", "tmate github actions", "tmate not working", "tmate invalid or expired session token", "tmate releases", "http tmate loveyour tv", "unable to locate package tmate", "tmate access denied check your ssh keys", "asciinema", "tmux", "tmate cheat sheet", "teleconsole", "tmate ssh keys not found", "tmate shortcuts", "gotty" ]
---

## What's tmate?

On *nix systems, sometimes we need support. And geeks don't like GUI apps just
to have your system in front of them, at least I don't like that :wink:

[tmate](https://tmate.io) is terminal sharing software you can use it to
connect with your friends and you both work from there. 
It's available in many distributions repos and in case you aren't lucky
enough, you can compile it from source or there are pre-compiled binaries
there in their Github page.

## Configuration

By default, tmate loads the system configuration file from
/etc/tmux.conf, if present, then looks for a user configuration file at ~/.tmux.conf and
~/.tmate.conf.

## Keybindings

Just like tmux, tmate uses `C-b` as prefix.

The default command key bindings are:
```

           C-b         Send the prefix key (C-b) through to the application.
           C-o         Rotate the panes in the current window forwards.
           C-z         Suspend the tmate client.
           !           Break the current pane out of the window.
           "           Split the current pane into two, top and bottom.
           #           List all paste buffers.
           $           Rename the current session.
           %           Split the current pane into two, left and right.
           &           Kill the current window.
           '           Prompt for a window index to select.
           (           Switch the attached client to the previous session.
           )           Switch the attached client to the next session.
           ,           Rename the current window.
           -           Delete the most recently copied buffer of text.
           .           Prompt for an index to move the current window.
           0 to 9      Select windows 0 to 9.
           :           Enter the tmate command prompt.
           ;           Move to the previously active pane.
           =           Choose which buffer to paste interactively from a list.
           ?           List all key bindings.
           D           Choose a client to detach.
           L           Switch the attached client back to the last session.
           [           Enter copy mode to copy text or view the history.
           ]           Paste the most recently copied buffer of text.
           c           Create a new window.
           d           Detach the current client.
           f           Prompt to search for text in open windows.
           i           Display some information about the current window.
           l           Move to the previously selected window.
           n           Change to the next window.
           o           Select the next pane in the current window.
           p           Change to the previous window.
           q           Briefly display pane indexes.
           r           Force redraw of the attached client.
           m           Mark the current pane (see select-pane -m).
           M           Clear the marked pane.
           s           Select a new session for the attached client interactively.
           t           Show the time.
           w           Choose the current window interactively.
           x           Kill the current pane.
           z           Toggle zoom state of the current pane.
           {           Swap the current pane with the previous pane.
           }           Swap the current pane with the next pane.
           ~           Show previous messages from tmate, if any.
           Page Up     Enter copy mode and scroll one page up.
           Up, Down
           Left, Right
                       Change to the pane above, below, to the left, or to the right of the current pane.
           M-1 to M-5  Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-horizontal,
                       main-vertical, or tiled.
           Space       Arrange the current window in the next preset layout.
           M-n         Move to the next window with a bell or activity marker.
           M-o         Rotate the panes in the current window backwards.
           M-p         Move to the previous window with a bell or activity marker.
           C-Up, C-Down
           C-Left, C-Right
                       Resize the current pane in steps of one cell.
           M-Up, M-Down
           M-Left, M-Right
                       Resize the current pane in steps of five cells.

     Key bindings may be changed with the bind-key and unbind-key commands.

```

## How to use?

Once installed, just invoke `tmate` from command line.
tmate needs an ssh key so in case you don't have an ssh key, generate one.

```bash
ssh-keygen
```

Once ready, invoke tmate. It will start connecting to its server and show you
in status bar once connected. 
You can now show the URIs by `show-messages` command.

```bash
tmate show-messages
```

It will provide you both [web, ssh] priviliged and non-privileged links.
Share with your friends how you like. 

Enjoy!

Here is a demonstration video.

{{< youtube 7yJRWL5TlFg >}}
