---
title: "SSH Passwordless Authentication"
date: 2020-10-06T13:45:06+05:00
draft: false
author: "Abdullah Khabir"
toc: true
comments: true
layout: post
tags: ["ssh", "passwordless authentication", "login", "pubkey authentication"]
description: ["How to enable passwordless authentication in ssh"]
keywords: ["ssh", "passwordless authentication", "login", "pubkey authentication"]
---


### SSH login without password?


![ssh authentication without password](/images/sshlogin.jpeg)


Yeah you heard it right. Today I'm going to teach you how you can enable passwordless authentication in ssh.

You can login to your linux servers without password. How? Keep reading...

Edit the SSH main configuration file.

```bash

$ sudo vi /etc/ssh/sshd_config


...

PubkeyAuthentication yes

...

```

Edit this line. If you see `no`, change it to `yes`. If this line is commented out, uncomment it.


Restart ssh.


```bash

$ sudo systemctl restart sshd

```

In local client, create a new ssh key if you don't have one. 

```bash

$ ssh-keygen

```

Hit enter to all questions.

Now copy your public key and upload it to your server's user's home directory's .ssh directory.

```bash

$ ssh-copy-id user@remote_host

```

Now you can login to your server without even asking for a password.

Here is a YouTube demonstration video. 

{{< youtube GT7yeeO1ewU >}}

Thanks for reading.


