---
author: Abdullah Khabir
layout: post
title: 'Encrypted dotfiles with GnuPG'
comments: true
url: encrypted-dotfiles
lastmod: true
date: 2020-01-12
description: 'Encrypted dotfiles with GNUpg'
tags:
  - gnupg
  - gpg
  - dotfiles
  - encrypted_dotfiles
  - configuration_files
  - encryption
toc: true
keywords: ["dotfiles i3", "dotfiles tutorial", "dotfiles windows", "dotfiles python", "dotfiles vim", "ubuntu dotfiles", "vscode dotfiles", "dotfiles zsh", "dotfiles i3", "dotfiles-windows", "link dotfiles", "dotfiles python", "ubuntu dotfiles", "dotfiles bashrc", "webpro dotfiles", "clean up dotfiles", "dotfiles website", "dotfiles hackernews", "alra dotfiles", "mathiasbynens/dotfiles", "dotfiles manager arch linux", "github codespaces dotfiles", "holman's dotfiles", "how to manage dotfiles reddit", "hacker news dotfiles", "how to store dot files", "stow dotfiles", "bootstrap sh dotfiles", "xdefaults", "dotfiles bash_profile", "backup git config", "mac sync dotfiles", "github io dotfiles", "dotfiles i3", "dotfiles-windows", "link dotfiles", "dotfiles python", "ubuntu dotfiles", "dotfiles bashrc", "webpro dotfiles", "clean up dotfiles", "dotfiles website", "dotfiles hackernews", "alra dotfiles", "mathiasbynens/dotfiles", "dotfiles manager arch linux", "github codespaces dotfiles", "holman's dotfiles", "how to manage dotfiles reddit", "hacker news dotfiles", "how to store dot files", "stow dotfiles", "bootstrap sh dotfiles", "xdefaults", "dotfiles bash_profile", "backup git config", "mac sync dotfiles", "github io dotfiles", "common dot files", "ubuntu dotfiles", "dotfile generator", "dotfiles tutorial", "sync dotfiles", "linux install dotfiles", "dotfile template", "symlink dotfiles", "dotfiles submodule", "dries vints dotfiles", "linux install dotfiles", "best dotfile", "dotfiles install script", "dotbot", "dotfiles i3", "dotfiles github", "dotfiles-windows", "ubuntu dotfiles", "what are dotfiles", "dotfiles website"]
---

## What these dotfiles are?

In unix world, most programs are configured command line and they save their
configurations in homedir usually a file which names start with a dot. Thus
dotfiles.

Power users care about them alot. You can store your dotfiles on some git server
like github or gitlab and many other options there like you can host them on
your VPS as well. If you use git to store them and you don't have a private
repository, anybody can see them.

Dotfiles often contains some private data like plain text passwords and some
informations you don't wanna share publicly. Today I'm gonna show you some
technique so your dotfiles will be encrypted and nobody will be able to see
them.

## Requirements

You will need a gpg key, stow and a git repository.
Create a gpg key if you don't have one already.

## Real procedure?

So you have a git repository now. Call it ~/cfg in my case.

Inside ~/cfg you have some files which you don't wanna share publicly
unencrypted. But you still want them to be hosted somewhere for backup.

For example, I have a file adbkey which is private key for adb devices
(androids).

I don't wanna share it publicly but I still wanna version control it.
So lets do it in a secure fashion.

## Create directory structure

```sh
$ mkdir -p ~/cfg/etc/.android
$ mkdir -p ~/cfg/etc/.local/share/misc
```

## Move the sensitive files

So now we have created the directories. Lets move the real files we wanna add to
git repository for tracking.

```sh
$ mv ~/.android/adbkey ~/cfg/etc/.local/share/misc
```

## Create a symlink for private file

```sh
$ cd ~/cfg/etc/.android
$ ln -sf ../.local/share/misc/adbkey adbkey
```

## Create a symlink or stow the file(s)

Let stow do this for you. It's very useful piece of software and I manage my
dotfiles using it. But you can use ln too if you can't find stow in your
distribution repositories.

```sh
$ cd ~/cfg
$ stow etc
```

It will create a symlink ~/.android/adbkey pointing to
~/cfg/etc/.android/adbkey.

## Track file(s) with git

Now we can add this symlink to track. Git doesn't track the real file. It will
only track the symlink.

```sh
$ cd ~/cfg
$ git add etc/.android
```

## Tell git to ignore sensitive file(s)

```sh
$ echo "etc/.local/share/misc/" >> ~/cfg/.gitignore
```

Now it won't track the sensitive files in ~/cfg/.local/share/misc.

## Compress the sensitive file(s) with tar

```sh
$ cd ~/cfg
$ tar czf encrypted.tar.gz etc/.local/share/misc
```

## Encrypt the tar archive and delete the un-encrypted archive

```sh
$ gpg -er abdullah@abdullah.today encrypted.tar.gz
$ rm encrypted.tar.gz
```
Replace abdullah@abdullah.today with your email ID you used while creating gpg
key.

## Add encrypted archive to git

```sh
$ cd ~/cfg
$ git add encrypted.tar.gz.gpg
```

## Commit and push the changes to remote

```sh
$ git commit -m 'adding encrypted dotfiles'
$ git push
```

## Functions to automate this process

Here I have written two bash/zsh functions to automate this stuff.
endot to encrypt the dotfiles and dedot to decrypt them.

```sh
endot()
{
  cd ~/cfg
  tar czf encrypted.tar.gz etc/.local/share/misc
  gpg -er abdullah@abdullah.today encrypted.tar.gz
  rm encrypted.tar.gz
}
```

and

```sh
dedot()
{
  cd ~/cfg
  gpg -do encrypted.tar.gz encrypted.tar.gz.gpg
  tar xvf encrypted.tar.gz
  rm encrypted.tar.gz
}
```

You can save the functions into your shell initialzing files like ~/.zshrc for zsh
and ~/.bashrc for bash.

Whenever you change these sensitive files, just run the endot function in the
terminal and it will encrypt the new dotfiles and git will complain that the
encrypted.tar.gz.gpg is modified so commit it and push the new version.

I hope this article will help many of you. If you have better alternatives or
need some assistance, just
leave a comment.
