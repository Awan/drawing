---
layout: post
author: Abdullah Khabir
date: 2020-05-07
url: gists
comments: true
toc: true
description: "Paste snippets from github into Terminal"
title: "Create/paste snippets from Terminal"
featuredImage: "/images/gists.jpeg"
tags:
  - gist
  - gists
  - snippets
  - github
  - github-gists
  - gitlab snippets
---

## What's snippet/gist?

gist is a piece of code or maybe some important text shared on
[Github](https://github.com) or [Gitlab](https://gitlab.com).
It's actually a git repository so you can clone it, work on it locally and push
changes.

## Share gists from Terminal

There are multiple programs available in many distributions for this purpose.
You just have to find it. On [Arch Linux](https://archlinux.org), you can
install [gist](https://www.archlinux.org/packages/community/any/gist/).

Here is how it works in terminal.

![share text using gist](/images/gists-1.jpeg)

You can update an existing gist if you know its hash ID. It has a man page yeah
;-) 

## Share gists from EDITOR

If you're using `vim`, add this line to your `~/.vimrc`.

```bash 
$ command! -range=% GT <line1>,<line2>w !gist -c -p -f %

```
Now in command mode, you can type `GT` and hit enter to create a snippet from
your editor's window.

## Get gists output in Terminal


So now you know how to share snippets from terminal. But what if someone has
given you some URL and you want to see it in terminal?

I have got this snippet shared, for example

{{< gist 0962f678ff2b396cbd34cf542e56137b >}}

It's hosted on github at this URL.

`https://gist.github.com/Awan/0962f678ff2b396cbd34cf542e56137b`

Using `cURL` or `wget` you will get this github page html in your terminal.

So here is a magic trick for you ;-)

Replace `github.com` to `githubusercontent` and append `/raw` at the end.

The above snippet's URL now becomes:

`https://gist.githubusercontent.com/Awan/0962f678ff2b396cbd34cf542e56137b/raw`

Now you can use `cURL` or `wget` to see/save the snippent right from your
terminal.

![get text from gist](/images/gists-2.jpeg)


That's it. You can save it to some file as well.

Thanks for reading. 
