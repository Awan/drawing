---
author: "Abdullah Khabir"
layout: post
title: 'My Email Setup' 
url: mutt
date: 2019-09-17
comments: true
description: 'My Terminal based mail setup'
featuredImage: "/images/mutt.jpeg"
tags:
  - mutt
  - email
  - commandline_email
  - neomutt
  - isync
  - mbsync
  - sendmail
  - mail
toc: true
---

## why commandline?

*_TL;DR_*

powerful and efficient!

I have been creating multiple accounts for email since 2009. Some of the
accounts I still have them in 2019 and others I don't have access to. I realized that having your own email server on your own domain is a good thing. So I started creating mail server. I did that well. Learned a lot. 


As you know I like things to keep minimalistic yet powerful than most written
GUI apps. So here is how I use a command line email client <b>Mutt</b> with many other tools which make it perfect setup.

There are several scenarios. Like if you have an email server, you can ssh into it and start reading your email inside some tmux session. 

But what I have is totally different.

I use isync to sync my remote mailbox with local one, invoke notmuch and
read/reply the emails using mutt.

### Installation


## Install required tools  

```bash
$ sudo apt install -y isync mutt notmuch

```


### sync mail accounts

## isync 

I use <b>isync</b> to sync mailboxes. 

Let's configure it.

```bash
IMAPAccount abdullah
Host imap.gmail.com
User user@gmail.com
PassCmd "gpg -dq ~/.local/share/misc/abdullah.gpg"
SSLType IMAPS
CertificateFile /etc/ssl/certs/ca-certificates.crt

IMAPStore abdullah-remote
Account abdullah

MaildirStore abdullah-local
Subfolders Verbatim
Path ~/.mail/
Inbox ~/.mail/Inbox

Channel abdullah
Master :abdullah-remote:
Slave :abdullah-local:
Patterns *
CopyArrivalDate yes
Create Both
SyncState *


```

Replace mailbox stuff with yours where necessary. And start isync.

```bash
$ mbsync -VXa 
```

Don't forget to run <b>notmuch</b> before or after it. Answer all questions
it asks, it's one time process. You can edit the cofiguration later, they
reside in your home directory.


## Mutt

Mutt is a command line utility which runs inside a terminal session.
Pretty easy to use and have tons of features.


Mut looks for configuration files for user base in $HOME/.config/mutt/. So
create this directory.

```bash
$ mkdir -p ~/.config/mutt/credentials
$ touch ~/.config/mutt/muttrc
```

Edit <b>muttrc</b> to your needs. I'm pasting mine here for reference.

```bash
$ cat ~/.config/mutt/muttrc


#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ Author ▓ Abdullah <https://abdullah.today/>
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#


# source important files

source $HOME/.config/mutt/colorrc
source $HOME/.config/mutt/gpgforak.rc
source ~/.config/mutt/aliases



set folder                         = ~/.mail
mailboxes                          = `echo $HOME/.mail/*`
set from                           = abdullah@abdullah.today
set sendmail                       = msmtp
set abort_noattach                 = "no"
set abort_noattach_regexp          = "attach"
set abort_nosubject                = "ask-yes"
set alias_file                     = "~/.config/mutt/aliases" #source it
set alias_format                   = "%4n %2f %t %-10a   %r"
set allow_8bit                     = "yes"
set allow_ansi                     = "no"
set arrow_cursor                   = "yes"
set ascii_chars                    = "no"
set askbcc                         = "no"
set askcc                          = "no"
set assumed_charset                =
set attach_charset                 =
set attach_format                  = "%u%D%I %t%4n %T%.40d%> [%.7m/%.10M, %.6e%?C?, %C?, %s] "
set attach_sep                     = "\n"
set attach_split                   = "yes"
set attribution                    = "On %d, %n wrote:"
set attribution_locale             =
set auto_tag                       = "no"
set autoedit                       = "yes"
set beep                           = "yes"
set beep_new                       = "yes"
set bounce                         = "ask-yes"
set bounce_delivered               = "no"
set braille_friendly               = "no"
set browser_abbreviate_mailboxes  = "yes"
set certificate_file              = "~/.config/mutt/certs"
set crypt_autosign                = yes
set crypt_replyencrypt            = yes
set date_format                   = "%d/%m"
set editor                        = vim
set fast_reply                    = yes
set header_cache                  = ~/.cache/mutt
set imap_keepalive                = 300
set include                       = yes
set mail_check                    = 60
set mail_check_stats              = yes
set mailcap_path                  = ~/.config/mutt/mailcap
set mbox_type                     = Maildir
set message_cachedir              = ~/.cache/mutt/messages
set pager                         = vim
set pager_context                 = 3
set pager_index_lines             = 8
set pgp_autosign                  = yes
set pgp_replysign                 = yes
set pgp_replysignencrypted        = yes
set pgp_sign_as                   = 0x5CBC7BC7
set pgp_timeout                   = 3600
set pgp_use_gpg_agent             = yes
set postpone_encrypt              = yes
set postpone_encrypt_as           = 0xE6E81782
set postponed                     = ~/.mail/Drafts
set prompt_after                  = no
set quote_regexp                  = "^( {0,4}[>|:#%]| {0,4}[a-z0-9]+[>|]+)+"
set record                        = ~/.mail/Sent
set trash                         = ~/.mail/Trash
set reply_regexp                  = "^(([Rr][Ee]?(\[[0-9]+\])?: *)?(\[[^]]+\] *)?)*"
set rfc2047_parameters            = yes
set send_charset                  = utf-8
set sidebar_format                = "%B%?F? [%F]?%* %?N?%N/?%S"
set sidebar_visible               = yes
set thorough_search
set sidebar_width                 = 24
set status_chars                  = " *%A"
set sig_dashes                    = no
set signature                     = ~/.config/mutt/signature
set sort                          = threads
set sort_aux                      = reverse-last-date-received
set spoolfile                     = ~/.mail/INBOX
set ssl_force_tls                 = yes
set ssl_starttls                  = yes
set timeout                       = 3
set use_from                      = yes
set quit
set visual                        = vim
set wait_key                      = no
set status_format                 = "───[ Folder: %f ]───[%r%m messages%?n? (%n new)?%?d? (%d to delete)?%?t? (%t tagged)? ]───%>─%?p?( %p postponed )?───"
set sort_re
set edit_headers
unset confirmappend
unset imap_passive
unset mark_old
set smart_wrap
unset markers
set pipe_decode
set text_flowed
set pager_stop
auto_view application/pgp-encrypted
set menu_scroll
set uncollapse_jump
set delete
set tilde
set imap_check_subscribed

# HTML

auto_view text/html
alternative_order text/enriched text/plain text/html
alternative_order text/plain text/enriched text/html
alternative_order text/plain text/html

# Keybindings

bind attach <return> view-mailcap
bind attach,index G last-entry
bind attach,index g first-entry
bind attach,index,pager \CD next-page
bind attach,index,pager \CU previous-page
bind browser $ check-new
bind index   \t   next-unread
bind index  ,\t previous-unread
bind index <space>  collapse-thread
bind index <tab>    sync-mailbox
bind index G        last-entry
bind index R        group-reply
bind index,pager <down>   sidebar-next
bind index,pager <right>  sidebar-open
bind index,pager <up>     sidebar-prev
bind pager G bottom
bind pager R  group-reply
bind pager g top
bind pager gg top
bind pager j  next-line
bind pager k  previous-line

# colors

color header blue default "^(Subject)"
color index red white "~v~(~F)!~N"
color sidebar_new yellow default

# macros

macro index C "<copy-message>?<toggle-mailboxes>" 
# macro index q "<sync-mailbox><shell-escape>/usr/bin/offlineimap -o >/dev/null 2>&1<enter><quit>"
macro index M "<save-message>?<toggle-mailboxes>"
macro index O "<shell-escape>mbsync -Va<enter>" 
macro index \Cr "T~U<enter><tag-prefix><clear-flag>N<untag-pattern>.<enter>" 
macro index,pager U "<enter-command>set pipe_decode  = yes<enter><pipe-message>urlview<enter><enter-command>set pipe_decode = no<enter>""view URLs"

# headers

my_hdr User-Agent: 'Eat your heart out, Windows Lusers'
hdr_order from: to: cc: date: subject:
unhdr_order *

#vim:filetype=muttrc

```


## Automate it with systemd  

You can automate it with systemd. Here are two files which will invoke isync
a minute after your machine is rebooted and then after every two minutes
synchronization. 

A service file:

```bash
$ cat ~/.config/systemd/user/isync.service

[Unit]
Description=Mailbox Sync

[Service]
Type=oneshot
ExecStart=/usr/bin/mbsync -VXa
ExecStartPost=/usr/bin/notmuch new

```

and a timer:

```bash
$ cat ~/.config/systemd/user/isync.timer

[Unit]
Description=Mailbox Sync Timer

[Timer]
OnBootSec=1m
OnUnitActiveSec=2m
Unit=isync.service

[Install]
WantedBy=timers.target

```

Start them using:

```bash
$ systemctl --user --now enable isync.timer

```

### Password management
I use encrypted passwords. You can check my
[dotfiles](https://gitlab.com/Abdullah/cfg.git) for
reference.


Voila! You have a perfect email setup now. You can enable extra functionality
like encryption, password management, aliasing etc... Just have a look
[here](https://gitlab.com/Abdullah/cfg.git) if you
think something isn't discussed or well-explained, and don't forget to comment and lemme know about your thoughts. 

Here is a demonstration video.

{{< youtube vdTFRaM7YjQ >}}
