---
title: "Send Mail Using Gmail using Command Line"
date: 2020-11-29T07:32:13+05:00
draft: false
author: "Abdullah Khabir"
toc: true
comments: true
layout: post
url: send-mail-using-gmail-from-terminal
tags: ["mail", "gmail", "msmtp", "mutt", "terminal", "suckless"]
description: ["How to send mail using gmail from command line"]
keywords: ["gmail", "commandline", "msmtp", "mail", "commandline email", "send gmail from command line linux", "sendmail", "sendmail linux", "ssmtp", "unable to send mail from linux command line", "send email from command line", "linux send mail from command line using smtp server", "how to send mail from linux server to gmail", "mailx specify smtp server", "linux ssmtp", "missing nss-config-dir variable.", "ssmtp: cannot open mail:25", "linux mail command set server", "linux command line send email specify smtp", "send gmail from command line windows", "ssmtp", "shell script to send email automatically", "mail shell", "mail function bash", "sendmail in a script", "send mail from shell script with attachment", "shell script to send email with html body", "sendmail.mc location", "linux sendmail google smtp", "ubuntu sendmail smart host", "configure sendmail to use smtp relay", "makemap command not found", "configure sendmail to send mail to internet", "bash mail to gmail", "sendmail in single line", "ssmtp subject line", "sendmail command line subject", "sendmail g suite", "unable to send mail from linux command line", "linux mail command", "send email from command line mac", "mail command not found", "linux sendmail configuration", "mail command in unix example with attachment", "sendmail from address", "sendmail subject", "sendmail not working", "sendmail: cannot open mail:25", "mail command in ubuntu", "ssmtp: invalid response smtp server", "ssmtp: authorization failed", "ssmtp ubuntu", "ssmtp timeout" ]
---

Yeah, you can send mail from your gmail account using command line.

### Requirements

You have two options here.

### Gmail account settings

Either [enable less secure apps](https://myaccount.google.com/lesssecureapps) in your Google account or [Generate an app password](https://myaccount.google.com/apppasswords).

### Tools being used

For Arch Linux:

```bash
$ sudo pacman -S msmtp 
```

For Debian, Ubuntu and other Debian derived distributions:

```bash
$ sudo apt install -y msmtp
```

For Fedora, CentOS, Redhat etc:

```bash
$ sudo dnf install msmtp
```

### Encrypt password

Using `gpg`, we are going to encrypt our password. I have a detailed video tutorial on `gpg` if you're interested.

{{< youtube lDyj78M6_dQ >}}


```bash
$ gpg -er 'your gpg keyID' -o ~/.gmail-password.gpg -
```

Now enter the password for your gmail from first step. Once done, enter `Ctrl + D`.

### Configure msmtp

Paste this into `~/.msmtprc` or if you want `msmtp` system wide so any user on this system can use this gmail account to send mails, copy it to `/etc/msmtprc`.

```bash
defaults
auth    on
tls     on
tls_starttls    on
tls_trust_file  /etc/ssl/certs/ca-certificates.crt
logfile     ~/.msmtp.log

account myaccount
host    smtp.gmail.com
port    587
from    your_gmail_address
user    your_gmail_address
passwordeval    "echo $(gpg --batch -q --decrypt ~/.gmail-password.gpg)"

account default: myaccount
```

Replace `your_gmail_address` with your gmail address.

Voila.

### Send a test mail

We are done now. Just send a test mail now.

```bash
$ echo "Just a test mail" | msmtp -a default 'some email address'
```

### Use with mutt

You can use this `msmtp` setup with `mutt` which is suck less mail client and runs in a terminal.
I have a detailed video tutorial on `mutt` here.

{{< youtube vdTFRaM7YjQ >}}


Thanks for reading.


