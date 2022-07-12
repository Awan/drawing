---
author: Abdullah Khabir
layout: post
date: 2019-09-15
title: 'Google Chrome for deiban and derived distributions'
url: chrome
comments: true
toc: true
cover: 'images/chrome.jpeg'
description: 'How to install google chrome in Debian based distributions'
tags:
  - chrome
  - google
  - google-chrome
  - chrome_in_linux
keywords: [ "download chrome for linux", "install chrome on linux", "chrome for linux mint", "apt get install chrome", "how to install google chrome in ubuntu 32 bit", "install chrome in ubuntu 16 04 using terminal", "chrome download", "download google chrome for ubuntu 64 bit", "chrome for linux mint", "chrome for kali linux", "chrome for centos", "chrome 79 download ubuntu", "chrome policy json", "install chrome in ubuntu 16.04 using terminal", "install chrome on lubuntu", "install chrome from command line windows", "uninstall chrome ubuntu", "download chrome for boss linux installer", "install google chrome debian 10", "debian install chromium", "install chrome linux command line", "chrome kali", "how to download google chrome on debian 10", "shell install chrome", "install google chrome in ubuntu ask ubuntu", "ubuntu chromium", "firefox for linux", "linux chrome device", "chrome for linux 32 bit", "ubuntu install chromium", "install firefox ubuntu", "how to install google chrome in boss linux", "google chrome for linux mint 19", "how to put chrome on linux mint", "install chromium linux mint", "install chrome 73 ubuntu", "chrome 75 deb", "update chrome cli", "install chrome linux command line centos", "install chrome terminal mac", "install chrome in ubuntu 20.04 using terminal", "how to install chrome in kali linux 2020", "how to uninstall chrome in kali linux", "chrome not opening in kali linux", "google-chrome --no-sandbox", "best browser for kali linux", "install chromium in kali linux", "chrome for linux mint", "chrome for kali linux", "chrome for centos", "chrome 79 download ubuntu", "chrome policy json", "install chrome in ubuntu 16.04 using terminal", "install chrome on lubuntu", "install chrome from command line windows", "uninstall chrome ubuntu", "download chrome for boss linux installer", "install google chrome debian 10", "debian install chromium", "install chrome linux command line", "chrome kali", "how to download google chrome on debian 10", "shell install chrome", "install google chrome in ubuntu ask ubuntu", "ubuntu chromium", "firefox for linux", "linux chrome device", "chrome for linux 32 bit", "ubuntu install chromium", "install firefox ubuntu", "how to install google chrome in boss linux", "google chrome for linux mint 19", "how to put chrome on linux mint", "install chromium linux mint", "install chrome 73 ubuntu", "chrome 75 deb", "update chrome cli", "install chrome linux command line centos", "install chrome terminal mac", "install chrome in ubuntu 20.04 using terminal", "how to install chrome in kali linux 2020", "how to uninstall chrome in kali linux", "chrome not opening in kali linux", "google-chrome --no-sandbox", "best browser for kali linux", "install chromium in kali linux"]
---

You'll have to admit google chrome is super fast. Along with other plugins I love to use it as main browser. But unfortunately it isn't in debian repositories.

So how to install it? Here is the procedure you can follow to get
latest chrome from google. 

```bash
$ echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee -a /etc/apt/sources.list > /dev/null
$ sudo apt update
$ sudo apt install -y google-chrome-stable
```

Enjoy using Chrome.
