---
title: "How to set FQDN in Linux"
date: 2020-06-21T13:26:14+05:00
draft: false
author: Abdullah Khabir
toc: true
comments: true
layout: post
tags: ["fqdn", "hostname"]
description: ["After reading this post, you will be able to change hostname and FQDN in linux"]
keywords: ["FQDN", "hostname", "how to check fqdn in linux", "how to set domain name in redhat linux 7", "how to set domain name in linux", "how to set domain name in linux centos 7", "ubuntu 18 04 set fqdn", "ubuntu 20 04 set fqdn", "hostnamectl fqdn", "ubuntu 20 04 set domain name", "hostname fqdn windows", "ubuntu 18.04 fully qualified domain name", "change fqdn windows server 2016", "digitalocean fqdn", "how to create fqdn in windows server 2016", "hostname: the specified hostname is invalid", "fqdn ubuntu 16", "how to add fqdn in ubuntu", "how to setup fqdn", "set full hostname", "raspbian set fqdn", "linux set hostname centos 7", "how to change hostname in linux redhat 7", "hostnamectl set hostname", "how to change hostname in linux redhat 6", "linux change hostname without reboot", "how to change localhost name in linux", "linux change hostname debian", "change hostname windows", "how to change hostname in linux redhat 6", "how to change hostname in linux redhat 7", "linux change hostname centos", "how to change hostname in oracle linux", "change hostname fedora", "how to change hostname in kali linux", "linux change hostname without reboot", "ubuntu get hostname command-line", "ubuntu 20.04 change hostname", "ubuntu change username", "linux change hostname centos 7", "linux set-hostname centos 7", "you must be root to change the host name", "linux change hostname ubuntu", "how to change hostname in suse linux", "ubuntu change hostname permanently", "ubuntu 16 change hostname", "ubuntu 14.04 how to change hostname", "wsl change hostname", "how to change localhost name in linux", "set hostname variable linux", "how to change hostname in linux redhat 6", "how to change hostname in linux redhat 7", "linux change hostname centos", "how to change hostname in oracle linux", "change hostname fedora", "how to change hostname in kali linux", "linux change hostname without reboot", "ubuntu get hostname command-line", "ubuntu 20.04 change hostname", "ubuntu change username", "linux change hostname centos 7", "linux set-hostname centos 7", "you must be root to change the host name", "linux change hostname ubuntu", "how to change hostname in suse linux", "ubuntu change hostname permanently", "ubuntu 16 change hostname", "ubuntu 14.04 how to change hostname", "wsl change hostname", "how to change localhost name in linux", "set hostname variable linux" ]
---

### What is FQDN?

FQDN stands for Fully Qualified Domain Name. 
It's complete domain name for a computer or host on the internet.
FQDN is made of two things:
hostname and domain name.

Let me give you an example for demonstration.

FQDN for my mail server is `myemailserver.abdullah.today`.

The hostname is `myemailserver`.
The domain is `abdullah.today`.

## Requirements

You will need:

* IP Address
* Hostname
* FQDN

## Edit hosts file

Edit the `/etc/hosts` file and append this like this.

```bash
# vim /etc/hosts
...
192.168.1.100 myemailserver.abdullah.today myemailserver
...
:wq!
```

Replace IP address with your host IP, hostname with what your want to set or what you already have set.

## Edit hostname

Edit `/etc/hostname` and replace with your new hostname if you want to change
hostname as well.

```bash
# vim /etc/hostname

myemailserver

:wq!
```

Or you can use `hostnamectl` to set hostname.
