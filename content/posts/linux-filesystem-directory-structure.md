---
title: "Linux Filesystem Directory Structure"
date: 2020-12-17T14:24:49+05:00
draft: false
author: "Abdullah Khabir"
toc: true
comments: true
layout: post
tags: ["linux filesystem directory structure", "filesystem", "pathnames", "absolute pathnames", "relative pathnames"]
description: ["linux filesystem directory structure explained"]
keywords: [ "file system hierarchy in linux pdf", "linux directory structure command", "linux file system hierarchy diagram", "linux file system structure", "filesystem hierarchy standard pdf", "linux directory structure cheat sheet", "linux root directories", "linux hierarchy tree", "linux directory structure cheat sheet", "linux standard directories in hindi", "linux directory structure command", "sys directory in linux", "fhs specification", "usr directory", "linux file system structure pdf", "explain linux file system", "in linux a directory is a special type of", "all filenames in linux are case-sensitive.", "file system hierarchy in linux pdf", "linux file system hierarchy diagram", "explain the function of ls-a command", "linux distro hierarchy", "redhat file system hierarchy", "file permissions can be set using two modes", "linux file system ppt", "unix file system hierarchy standard", "filesystem hierarchy standard windows", "linux local directory", "shareable and static directories of fhs", "sharable and static directories of fhs", "linux fhs var", "host specific system configuration", "types of files available in linux", "structure of shell in linux", "file system hierarchy in unix", "memory directory linux", "linux file system pdf", "linux file system commands", "filesystem in userspace", "/dev/process in linux", "in linux, a directory is a special type of", "filesystem types", "boot block linux", "sudo fsck", "dev directory in linux", "sudo fsck dev sda3", "linux dev type", "absolute and relative path in python", "absolute path example", "relative path example", "how to find absolute path in linux", "get absolute path linux", "absolute vs relative path html", "absolute path and relative path in java", "paths in linux", "relative path example", "absolute path example", "how to find absolute path in linux", "relative to-home pathname", "absolute path windows command line", "absolute path and relative path in python", "linux reference path", "relative path navigation", "using . and .. in linux", "root path linux", "absolute path and relative path in java", "absolute path to file linux", "example of relative path", "list out types of directory structure", "linux relative path up one level", "./ vs ../ path linux", "where temporary files are created in unix?", "pathname in unix", "* and ? cannot match ____", "what is the date format in unix", "how to set a password for a file in vi editor", "which is not the part of unix architecture?", "command to see the system information in unix", "mkdir command in linux javatpoint", "ls command in java", "rmdir command in linux javatpoint", "create a directory in linux using java", "ls -ltr command in linux" ]
---


Unlike other operating systems, in linux everything starts from /. This is called root directory.

You can use `cd` command to navigate in filesystem. If you're inside some directory and you want to know where you're inside the directory tree, just type `pwd` and it will show you the current working directory. `pwd` stands for `print working directory`.

`cd` command needs some arguments if you want to visit some other directory. By default if you don't provide it some arguments, it will change the directory to user home directory. If you start a terminal emulator or a virtual console, it starts inside user home directory be default as well.


`cd` needs a pathname if you want to change directory to some directory inside the filesystem. A pathname is a route to that directory. 
There are two types of pathnames.

### Absolute Pathnames

An absolute pathname starts from root directory /. For example if you want to visit `/usr/bin`, you type / first. Then the directory name.
Absolute pathnames are complete paths starting from / (where filesystem begins) to the file or directory.

### Relative pathnames

Unlike absolute pathname, relative pathnames start from current working directory (pwd).
If you're in `/var/log` directory, and you want to visit `journal` directory which is a child directory of current working directory, you type `cd journal`.

If you want to visit the parent directory of current working directory which in this case is `/var`, just type, `cd ../var`.

I have a YouTube video tutorial on this topic as well.

{{< youtube fUmSm4LD3gQ >}}

