---
title: Keep your code in GitLab
link: start/gitlab.html
permalink: start/gitlab.html
tags: gitlab
layout: post
description: What is GitLab and how to put your code there
image: images/start/git/icon.jpg
---

## Git and GitLab

GitLab is a tool that allows for an easy usage of git repositories (for version control)
and also for continuous integration/deployment (very similar to GitHub).
Having your code on GitLab has many advantages
(it makes it easier to collaborate on the same code, and it allows you to setup automatic actions--this is how this website is built!), 
but for the moment we can focus on the ones related to version control.
This basically means that you can use it to always have a backup of your code,
where you can access at any moment all the old versions.
Your code will also be accessible online, so that you can show it to other people. 


## Basic git instructions

## Add your code in GitLab

To access gitlab you can go here: [gitlab.cern.ch](https://gitlab.cern.ch/). 
You should be able to login with your usual cern account. 
Then you can create a new project (a repository that contains
all your files related to a certain topic)
by clicking on `New project` here:
![git1](/students/images/start/git/git1.png)

And you fill all the fields following this:

![git2](/students/images/start/git/git2.png)

Then you go on the directory on lxplus or on your local machine where you have the code
you want to put on GitLab (if it's on lxplus, you can access with the usual
ssh you have been doing so far) and you follow the instructions for `Push an existing folder`.

![git3](/students/images/start/git/git3.png)

Notes:
- If you set the remote repository through http, as in the example above,
every time you push to your GitLab repo you will be requested to
insert your username and password.
There's a way around that, and we'll set this up in the coming days, but for now it might be easier to start with this
- when you do `git add .` It will add to the git repository all the files you have in your folder. This means that all the files you have in your repository will be tracked and available online. This might not be what you want, for example you do not want to add have files like ROOT files, or there might be some junk files you do not want to add, or the temporary files that are sometime created by text editors. To avoid this, instead go `git add .`, you can just do `git add your-file-name.py` (and do it multiple times if there are several files you want to add). 
- every time you want to add a new file to your git repository you need to do the `add`, `commit` and `push` steps
- every time you make a change to a file that is already part of your git repo, you just need to do the `commit` and `push` steps 
- the `git status` command will show you which files are in which stage 
