---

title: git-cheatsheet
date: 2019-04-01 23:33 UTC
tags: 
published: false

---

## Git Cheat Sheet
  git checkout *COMMIT* -- *FILES* -> restores the given files to the commit id provided
  gitlog --all --graph --decorate --oneline
  HOW TO TAG YOUR COMMITS?
  
  to merge staging to master

  1. checkout master
  2. git merge staging --no-ff
  3. git checkout staging
  4. get rebase master
  <-- this has to happen to get the staging branch onto of the merge commit?
