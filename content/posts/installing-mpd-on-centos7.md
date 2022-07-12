---
title: "Installing MPD on CentOS7"
subtitle: ""
date: 2022-06-19T01:32:54+05:00
lastmod: 2022-06-19T01:32:54+05:00
draft: false
author: "Abdullah Khabir"
authorLink: "https://abdullah.today"
description: "How to install MPD on CentOS7"
url: 'install-mpd-on-centos7'
tags: ['CentOS7', 'MPD', 'epel-release', 'music', 'mpd', 'ncmpcpp', 'mpc', 'music player daemon']
categories: ['music', 'software', 'linux']
layout: post
keywords: ['CentOS7', 'MPD', 'epel-release', 'music', 'mpd', 'ncmpcpp', 'mpc', 'music player daemon', 'Abdullah', 'Abdullah Khabir']

hiddenFromHomePage: false
hiddenFromSearch: false

featuredImage: "/images/mpd.jpeg"
featuredImagePreview: "" 

toc:
  enable: true
math:
  enable: false
lightgallery: false
license: ""
---
### Why CentOS7?

Sometimes in production you have to use CentOS7 even if it has lost its life. 
Or you might be working with vagrant and only OS you have available is CentOS7. 

### Installing packages from official repositories

CentOS7 has very limited packages available in official repositories. So you 
have to install epel-release and nux-dextop packages to extend your packages 
list.

### Install epel-release

By default, epel-release isn't installed. So first step you have to install 
epel-release. It's available in official repositories. Just execute following 
command:

```bash
# yum install -y epel-release
```

### Download nux-dextop

As stated above, CentOS7 has very limited packages. But still you can use other 
repositories to overcome this issue. Nux Dextop is a third-party RPM repository that contains multimedia and desktop packages for Enterprise Linux distributions such as RHEL, CentOS, Oracle Linux, Scientific Linux and more.
First of all, you have to download the rpm package for nux-dextop.

```bash
# curl -O http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
```

### Install nux-dextop

Next step will be installing downloaded rpm package.

```bash
# rpm -Uvh nux-dextop-release-0-5.el7.nux.noarch.rpm
```

### Install MPD

So now you're ready to install MPD. MPD can be configured/used with mpc and 
ncmpcpp. Just execute the final command:

```bash
# yum install -y mpd ncmpcpp mpc
```

### Enjoy

Congrats! You just installed MPD. Next step would be configuration. You can use 
my [GitHub repository](https://github.com/Awan/cfg.git) to copy configuration files. 

### Demonstration video

Here is a demonstration video...

{{< youtube hksM3xqOU4w >}}
