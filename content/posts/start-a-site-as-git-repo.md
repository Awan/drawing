---
author: "Abdullah Khabir"
comments: true
toc: false
date: 2020-05-10
tags: ['git', 'web development', 'website', 'hugo', 'vim']
url: site-as-git-repo
description: "How to manage a website using git"
title: "How to manage a website using git"
layout: post
keywords: [ "github", "host website on github custom domain", "github pages personal website", "github login", "how to publish website on github", "github pages tutorial", "how to delete repository in github", "github website template", "github pages examples", "github pages custom domain", "github pages react", "github pages themes", "github website template", "github pages jekyll", "host website on github custom domain", "github pages personal website", "how to publish repository in github", "github desktop publish website", "github pages khan academy", "your site is ready to be published at", "github.io examples", "how to put a website on a server", "hosting a web server", "heroku", "github desktop", "github pages not free", "how to connect git to github", "github pages tools", "how to add projects to github pages", "github pages multiple repositories", "getting started with git on windows", "how to use git for website development", "hugo themes", "gitlab", "github", "bitbucket", "git push dreamhost", "using git to manage a website", "dreamhost git lfs", "dreamhost shared hosting git", "github sync with server", "git remote live", "webpage hosted by github", "github host game", "serving html from github", "how to host php website on github", "how to host a website on github youtube", "how to activate github pages", "github pages examples", "github pages custom domain", "github pages react", "github pages themes", "github website template", "github pages jekyll", "host website on github custom domain", "github pages personal website", "how to publish repository in github", "github desktop publish website", "github pages khan academy", "your site is ready to be published at", "github.io examples", "how to put a website on a server", "hosting a web server", "heroku", "github desktop", "github pages not free", "how to connect git to github", "github pages tools", "how to add projects to github pages", "github pages multiple repositories", "getting started with git on windows", "how to use git for website development", "hugo themes", "gitlab", "github", "bitbucket", "git push dreamhost", "using git to manage a website", "dreamhost git lfs", "dreamhost shared hosting git", "github sync with server", "git remote live", "webpage hosted by github", "github host game", "serving html from github", "how to host php website on github", "how to host a website on github youtube", "how to activate github pages" ]
---


Git is another awesome tool developed and maintained by Linus Torvalds who wrote linux kernel. In this post I'll explain how can we use it for our site maintenance. I have a vps on which my site is hosted along with a mail server, git server and a web server too. But I'm sure this guide can be used with shared hosting accounts with some modifications.

Install git. Once installed, as root user, create git user and add it to www-data group.

```bash
useradd git -m -G www-data
```

Login into this new git user.


```bash
su - git
```

Create an ssh directory for this account.

```bash
mkdir .ssh
```

Upload your user ssh public key to this directory how you want. I use pastebin here. Assuming you pasted your public key somewhere on pastebin, I'll fetch it using curl.

```bash
curl -o .ssh/authorized_keys 'pastebin address where you pasted the public key'
``` 

Create a directory for your user you wanna use for your site or this user maybe the one you use to login to your vps using ssh. I'll use user z for this post.

```bash
cd && mkdir z && cd z
```

Create a git repo here now.

```bash
git init --bare mysite.git
```
Create a hook in .git directory.

```bash
echo "#!/bin/sh \
cd /var/www/html \
unset GIT_DIR  \
git pull \ " > ~/z/mysite.git/hooks/post-receive && chmod +X ~/z/mysite.git/hooks/post-receive
```
That's it. Now go to the directory where your site is hosted, in this example we used /var/www/html for site and z as username which is used to maintain our site in future using git like in above hook we used that. You can modify both hook and here this code too according to your needs.

```bash
cd /var/www/html && git clone ~/z/mysite.git && cd mysite.git && mv * /var/www/html/ &&  cd /var/www/html && rm -rf mysite.git
```

We have made it. Now in your local machine, clone this repo this way.

```bash
git clone 'your vps ip or domain if it's pointed to your vps':z/site.git
```
Go to the directory you just cloned, do some modifications and push the changes and you'll see the magic. If you have some problems just ping me and I'll be glad to help.
