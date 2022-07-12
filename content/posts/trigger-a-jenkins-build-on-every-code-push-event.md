---
title: "Trigger a Jenkins Build on Every Code Push Event"
subtitle: ""
date: 2022-06-21T18:07:52+05:00
lastmod: 2022-06-21T18:07:52+05:00
draft: false
author: "Abdullah Khabir"
authorLink: "https://abdullah.today"
description: "How to automatically trigger a jenkins build on GitHub code push"

tags: ['git', 'ci/cd', 'automation', 'jenkins', 'devops', 'github', 'integration']
categories: ['automation', 'CI/CD', 'continuous integration', 'devops', 'jenkins', 'github']

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
### Configure GitHub project

Go to your GitHub repository settings and click on Webhooks. Click on add a 
webhook.

In payload URL, add your jenkins installation URL + '/github-webhook/'. For 
example if my jenkins is running at https://jenkins.example.com:8080, I'll add 
_https://jenkins.example.com:8080/github-webhook/_.
Disable SSL verification. Select send me everything or you can select only push 
events. and lastly check the box which says **Active**.

### Configure Jenkins project

Go to your jenkins project configuration. Let's say I have a project __ak-project__, 
I'll go to _https://jenkins.example.com:8080/job/ak-project/configure_.

Go to __Build Triggers__ tab.

Check the option which says, __GitHub hook trigger for GITScm polling__.

Save your changes. 

You're all done. Now push some code to GitHub repository and see the magic in 
Jenkins... Enjoy!
