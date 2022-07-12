---
title: "Git Initial Setup"
author: Abdullah Khabir
date: 2020-07-12T18:58:13+05:00
layout: post
draft: false
featuredImage: '/images/git.jpeg'
url: configure-git
comments: true
toc: true
description: 'How to configure git first time'
tags:
    - git
    - initial git setup
    - git configuration
---


# How to configure Git

Git is a version control system by Linus Torvalds, same person who wrote linux kernel.

### Installation

In Archlinux, you can install git by:

```sh
$ sudo pacman -S git
```

In Debian and derived distributions:

```sh
$ sudo apt install -y git
```

### Configuration

You have to tell git about the author who committed changes so lets do it.

### Name and Email

Tell git about your name and email:

```sh
$ git config --global user.name 'Abdullah'
$ git config --global user.email 'abdullah@abdullah.today'
```

Replace `Abdullah` and with your name and `abdullah@abdullah.today` with your name and email.

### Signing key

If you use gpg to sign the commits/tags, you have to tell git about your signing key.

```sh
$ git config --global user.signingkey 'abdullah@abdullah.today'
```

Replace `abdullah@abdullah.today` with your email address you used when creating gpg keypair.


