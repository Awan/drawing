---
title: "git Cherry Pick"
date: 2020-06-04T14:25:08+05:00
author: Abdullah Khabir
tags: ['git', 'cherry-pick', 'development', 'advanced git', 'branches']
comments: true
toc: true
description: "How to do cherry-pick in git"
keywords: ["git cherry pick commit from another branch", "git cherry pick multiple commits", "git cherry pick specific commit", "git cherry pick merge commit", "git cherry pick m option", "git cherry pick multiple commits from another branch", "git cherry pick from another repo", "git cherry pick conflict", "git cherry-pick bad object", "git cherry-pick multiple commits", "is a merge but no -m option was given.", "git cherry-pick from another repo", "git undo cherry-pick", "git cherry-pick example from another branch", "automate git cherry-pick", "what is git log used for", "list of all commits before rebase", "cherry-pick in github desktop", "git merge javatpoint", "git cherry-pick pull request", "tortoisegit working tree changes", "tortoise git filter", "tortoisegit what is rebase", "tortoisegit view commit message", "tortoise git rebase meaning", "tortoise git cherry pick from another branch"]
layout: post
---

# Git cherry-picking

Aah picking cherries! :heart:

I'm using _git_ since I started using _linux_. Cherry-pick is one of those
commands I do alot with git. Right now I'm preparing a new cherry and will pick
it later. :wink:

## What's cherry-pick?

According to *man(1) git-cherry-pick*:

```
Given one or more existing commits, apply the change each
one introduces, recording a new commit for each. This
requires your working tree to be clean (no modifications
from the HEAD commit).
```

You're working on a git branch. And you want to introduce some new feature to
your repository, but you aren't sure if it will work or not yet. 
What will you do?

You create a new branch. Get your work done there. You can always *rebase* but
what if you have only some commits you want to apply to *master* branch?
Here _cherry-pick_ is your friend. 

## Create a new branch

I'm doing all this to explain it to new git_comers. 
My website readers know that [my site](https://abdullah.today/) is a git
repository. 

![my site is git repository](/images/git-site.jpeg)

So I'm on _master_ branch. I'm going to create a new branch from this branch,
checking out to it and start working. 

![new branch](/images/creating-branch.jpeg)

## Add files

You can see I have created a new branch and checked out to it. Wrote a new
_post_ which is shown as *Untracked*.

After adding some screenshots, I'm going to add them to my git repository.

![Adding images](/images/adding-images.jpeg)

I haven't done with this post yet so I haven't added it to index.

## Commit changes

So now you're ready to commit your changes. Add *Untracked or modified files* and commit them.

![adding cherry post](/images/cherry-post.jpeg)

Commit them.

![creating commit](/images/cherry-commit.jpeg)

Remember to copy or remeber first 6 digits of the new commit or you can
always get it by:

```sh
git log -n1 --format='%h'
```
> **_NOTE:_** Run above code only on new branch. It will give you commit hash of the commit you just made in current checked out branch.


## Checkout to master branch

So you have commits in new branch. Which you want to apply to your master
branch.
Checkout to master branch.

![checking out to master branch](/images/checkout-master.jpeg)

## Cherry-pick

Hmm. Here we go. Now we want commit made in new branch applied into our
master branch. You need to know the **hash** of the commit you made earlier into
other branch.

![cherry-pick being made](/images/cherry-done.jpeg)


Congrats! You just cherry-picked a new commit into your master branch from
cherry branch.

## Delete the temp branch

It is now safe to delete the new branch we made.

![deleting the branch](/images/cherry-branch-deleted.jpeg)


Feel free to ask more about advanced git topics. Enjoy cherry-picking!
:heart:
