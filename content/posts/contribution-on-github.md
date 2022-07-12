---
author: Abdullah Khabir
url: contribution-with-git
title: How to contribute to open source project
description: How to contribute to a project using git
date: 2020-02-12
comments: true
layout: post
cover: 'images/contribution.jpeg'
tags:
  - contribution
  - git
  - github
  - fork
  - repository
toc: true
keywords: [ "how to contribute to github as a beginner", "how to find projects to contribute to on github", "github login", "finding projects to contribute to on github", "how to contribute to open source projects", "github projects", "github open source projects for beginners", "github first contribution", "contribute to someone's repository", "github contributors readme", "github contributions graph", "github contributors file", "contribute to javascript", "github-contributions-api", "your first pull request", "contributing readme", "how to start github project", "how to contribute to git open source projects", "beginners guide to contributing to github", "request contribution github", "push to public repo github", "pull request open source project github", "how to contribute to open source quora", "how to contribute to open source reddit", "open source friday", "open source contribution meaning", "open source projects 2020", "open source projects github", "git is awesome", "should i use git or github", "is git necessary", "why should i use github", "how developers use git", "egghead github", "kcd im what oss", "best open source project to contribute", "how to write open source library", "pr welcome", "how to fork a repository in github", "github push to someone else's repository", "git checkout someone else's pull request", "how to work on someone else's branch", "git clone someone else's repository", "handling merge conflicts", "contribute to someone's repository", "github contributors readme", "github contributions graph", "github contributors file", "contribute to javascript", "github-contributions-api", "your first pull request", "contributing readme", "how to start github project", "how to contribute to git open source projects", "beginners guide to contributing to github", "request contribution github", "push to public repo github", "pull request open source project github", "how to contribute to open source quora", "how to contribute to open source reddit", "open source friday", "open source contribution meaning", "open source projects 2020", "open source projects github", "git is awesome", "should i use git or github", "is git necessary", "why should i use github", "how developers use git", "egghead github", "kcd im what oss", "best open source project to contribute", "how to write open source library", "pr welcome", "how to fork a repository in github", "github push to someone else's repository", "git checkout someone else's pull request", "how to work on someone else's branch", "git clone someone else's repository", "handling merge conflicts" ]
---

So you want to contribute to some open source project which is hosted on
git[hub,lab] or some other git website.
Here is all you want to do.

## Fork the repository

Create a personal fork. On github, visit the project repository and hit fork.
It will fork the project in your personal account.

## Clone it

Clone it in your local machine so you can work on it.
Remember you are cloning the fork, and not the original project.

```bash
$ git clone git@github.com:USERNAME/project
```

## Add the upstream

Add the original project as upstream.

```bash
$ git remote add upstream https://github.com/ORIGINAL_PROJECT_USERNAME/ORIGINAL_PROJECT_REPO
```

## Fetch latest work

If you forked a project just now, you can go to next step. If there is a time
gap, fetch latest work from upstream to your fork.

```bash
$ git pull upstream
```

## Create a new branch

Create a new branch so you can work there.

```bash
$ git checkout -b develop
```

## Add your contribution


Add your work in new created branch.
Commit changes. Make sure to write meaninigful commits.

## Push your work live

Push the changes you have made to remote origin.

```bash
$ git push
```

## Create a pull request

Go to your fork page and create a pull request. That's it


