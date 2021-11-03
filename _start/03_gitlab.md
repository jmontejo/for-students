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

[Git](https://git-scm.com/) is an open-source version control system (a software that
helps keeping track of changes in files, which is very useful both for personal use but
especially for collaborative efforts).  

[GitLab](https://about.gitlab.com/) is a web-based
DevOps platform.
It is a tool that allows for an easy usage of git repositories (for version control)
and also for continuous integration/deployment (very similar to GitHub).
Having your code on GitLab has many advantages
(it makes it easier to collaborate on the same code, and it allows you to setup automatic actions--this is how this website is built!), 
but for the moment we can focus on the ones related to version control.
This basically means that you can use it to always have a backup of your code,
where you can access at any moment all the old versions.
Your code will also be accessible online, so that you can show it to other people. 

## Add your code in GitLab

To access gitlab you can go here: [gitlab.cern.ch](https://gitlab.cern.ch/). 
You should be able to login with your usual cern account. 
Then you can create a new project (a repository that contains
all your files related to a certain topic)
by clicking on `New project` here:
![git1](/jmontejo/students/images/start/git/git1.png)

And you fill all the fields following this:

![git2](/jmontejo/students/images/start/git/git2.png)

Then you go on the directory on lxplus or on your local machine where you have the code
you want to put on GitLab (if it's on lxplus, you can access with the usual
ssh you have been doing so far) and you follow the instructions for `Push an existing folder`.

![git3](/jmontejo/students/images/start/git/git3.png)

Notes:
- If you set the remote repository through http, as in the example above,
every time you push to your GitLab repo you will be requested to
insert your username and password.
There's a way around that, and we'll set this up in the coming days, but for now it might be easier to start with this
- when you do `git add ` it will add to the git repository all the files you have in your folder.
This means that all the files you have in your repository will be tracked and available online. This might not be what you want, for example you do not want to add have files like ROOT files, or there might be some junk files you do not want to add, or the temporary files that are sometime created by text editors. To avoid this, instead go `git add .`, you can just do `git add your-file-name.py` (and do it multiple times if there are several files you want to add). 
- every time you want to add a new file to your git repository you need to do the `add`, `commit` and `push` steps
- every time you make a change to a file that is already part of your git repo, you just need to do the `commit` and `push` steps 
- the `git status` command will show you which files are in which stage. 
- The `push` step is the one that transmits the information to the web tool.
After that you should be able to see the files in the project url (the same one where previously you had the instructions).

## ssh key pair

You can use different protocols to transmit the information to gitlab. The instructions above are based on http,
and this way you don't have to do anything specific to set it up, but you have to type your password all the times. 
You can also use the ssh protocol (which is actually the suggested one), but to do that you need to setup an ssh key pair. You can find instructions on how to do it [here](https://docs.gitlab.com/ee/gitlab-basics/create-your-ssh-keys.html).

After you do that, you can use ssh instead of http. In practice you won't notice any difference. 
After creating and setting up the ssh key, to setup remote through the ssh protocol, you need the ssh path of your repository.
You can find it by clicking on `Clone` in the top-right corner. Then:
- if this is the first time you are adding the files on GitLab, follow the same steps as above, but replace the http path by
the ssh path. 
- if you had previously the ssh protocol, and want to switch to the ssh one:
`git remote set-url origin ssh-path`,
where `ssh-path` is the same path mentioned above. 

After that you should be automatically using ssh every time you pull or push. 

## Basic git instructions

GitLab has a very well documented general [Docs](https://docs.gitlab.com/) site.
In particular, at [this page](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html)
you can find a good description of most of the usual git operations, the interplay with
GitLab, and how to operate it from the command line. 

Also, running:
```
git --help
```
will show you the most common git commands with a short explanation.
Some commands that you will likely use frequently are:
* `git status`: check the status of the changes in your working directory
* `git add <file-name OR folder-name>`: prepare a local file or directory to be committed. If the
file was already saved in git, this tells git to prepare to save the changes to the file. If the file was
previously not in git, this tells git that from now on you want to include this file in the list of files to
keep track of. 
* `git commit -m "your comment to the changes"`: save the changes (commit). Please make sure to use a short but descriptive
commit message.
    *  Shortcut: `git commit -a -m "your comment to the changes"`: with the `-a` option, git automatically adds all the changes to the files
    that you are already keeping track of, so there's no need to do the `git add` step, unless you want to add new files. 
* `git push <remote> <name-of-branch>`: send the changes to GitLab.com
* `git pull`: download the recent changes in the repository (e.g. if you are collaborating with somebody else).

To have all the most important commands in a single pdf, you can take a look
at the [GitHub GIT CHEAT SHEET](https://education.github.com/git-cheat-sheet-education.pdf). 
