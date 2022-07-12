---
author: Abdullah Khabir
title: 'use sudo with no password'
layout: post
date: 2019-09-18
comments: true
toc: true
url: 'enable sudo with no password'
featuredImage: '/images/nopasswd.jpeg'
description: 'How to enable sudo without password in Debian, Ubuntu, Mint'
tags:
  - sudo
  - visudo
  - privileges
keywords: ["use sudo without password", "how to enable sudo without password",
"ubuntu 18 04 sudo without password", "sudo nopasswd not working", "sudo with password", "sudo no password specific command", "sudo without password mac", "run command as root without sudo", "ec2 ubuntu sudo without password", "sudo in shell script without password prompt", "sudo nopasswd not working", "sudo no ask", "su root without password", "ubuntu sudo specific command", "run command as root without sudo", "visudo vim", "ubuntu no sudo", "sudo su with password", "how to edit sudoers file without root", "sudoers with password", "visudo password all", "sudoers syntax", "sudo password for no password", "how to create sudo user in ubuntu", "ubuntu 18.04 remove login password", "sudo: parse error in /etc/sudoers", "ubuntu 20.04 gksudo", "allow ssh access via port 2222", "sudo without password mac", "visudo use vim", "sudoers: syntax error", "etc/sudoers d", "sudo no", "sudo example", "sudo do not prompt password", "sudo nopasswd not working", "sudo no ask", "su root without password", "ubuntu sudo specific command", "run command as root without sudo", "visudo vim", "ubuntu no sudo", "sudo su with password", "how to edit sudoers file without root", "sudoers with password", "visudo password all", "sudoers syntax", "sudo password for no password", "how to create sudo user in ubuntu", "ubuntu 18.04 remove login password", "sudo: parse error in /etc/sudoers", "ubuntu 20.04 gksudo", "allow ssh access via port 2222", "sudo without password mac", "visudo use vim", "sudoers: syntax error", "etc/sudoers d", "sudo no", "sudo example", "sudo do not prompt password" ]
---

In Unix world, we shouldn't use administrator user without some important stuff
which needs access to it. There is a utility <b> sudo </b> we can use to have
administrator access. But everytime you invoke it, it asks for your user's
password.

Today, I'm going to guide you, how you can use <b>sudo</b> without password.

Once you install <b>Debian</b>, you get some option to create a user. And if you
choose the option, "Don't use root for login", this new user becomes privileged
user by default. Which means you can invoke any command by using sudo. It will
ask for your password and command is executed.

Assuming you have a privileged user, edit sudoers file.

```bash
$ sudo visudo
```

On my Debian installation, it looks like this:

```bash
## /etc/sudoers
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root	ALL=(ALL:ALL) ALL

# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
```

At the end of the file, just append this:

```bash
username ALL=(ALL) NOPASSWD:ALL
```

Replace <b>username</b> with your username.

Here is my sudoers file.

```bash
$ sudo cat /etc/sudoers

#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root	ALL=(ALL:ALL) ALL

# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "#include" directives:

# I don't want a password everytime for my user.
ak	ALL=(ALL) NOPASSWD:ALL
#includedir /etc/sudoers.d
```



Now open a new terminal and try to install something using sudo. You won't be
asked to enter your password from now.
