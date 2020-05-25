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

   clone a directory without using current as the base directory with `git clone <url> .`
   Can't even count how many times I have had to clone a repo and then move it down a directory.

## Need to change a repo remote:
* Just run `git remote set-url <new-repo-url>` and then `git push`. If everything went well things should succeed.
If you have multiple branches tho you need to do some extra work: `git push origin refs/remotes/origin/*:refs/heads/*`
https://stackoverflow.com/questions/33327966/get-repoint-to-new-remote-repository


## Interactive staging

   Read all about it here: https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging

## Removing something from git history

Recently got myself into a situation where I had a password and username of a client in my code. I know, a very unsecure thing to do. I had to move fast, and doing
it the right way was not an option. The repo was private so I figured why not. I will clean up later...

And so two days later I did have the time and had to go back and fix my mistakes. I extracted the plain text password and username into a yml, file ignored it from the git repository and things were great.
Well... almost great. The password was still in the git commit where I intially added it. To fully clean up, I also had to remove it from the git history. Here is how I did that:

First of all I used git blame to find which commit was the dirty plain text password commit. 
`git blame -L <line_num_1>, <line_num_2> <file_name> # the L option lets you specify certain line numbers for the git blame`

Once I had the commit hash, I used `git checkout <commit_hash>`, changed the file, and amended the changes to the commit with `git commit --amend --no-edit`.

The next step is rebasing the master branch onto the ammended commit. What this does is take all commits after my 'dirty commit' and move them on top of it. This essentially creates two timelines, one with theplain text password, and one without. Once we do that we can then just destroy the plain text password timeline!

To rebase I first copied the hash of the changed commit. Make sure you do this before rebasing to master, might be kind of hard to find the hash afterwards. Then checkout to master `git checkout master` and run `git rebase <hash of commit you copied>`. Fix the merge conflicts and you are donee!

Alternatively you can use `rebase` with the `--onto` option, which I still haven't mastered.

## Updating something back in the past
https://stackoverflow.com/questions/1186535/how-to-modify-a-specified-commit
https://stackoverflow.com/questions/2719579/how-to-add-a-changed-file-to-an-older-not-last-commit-in-git

## Removing all untracked files
Sometimes you just add files, and tests to a repo - just to try things out. With git having my back I am not scared to do so.

Here are the commands that will clean up after the experiments:
`git clean -n` will show untracked files that will be deleted. Git status really does a similar thing.
`git clean -f` will delete the files shown from the command above.
`git clean -fd` will delete files and directories
`git clean -fX` will also remove ignored files
`git clean -fx` remove ignored and non-ignored files


git log --all --graph --decorate - grab the commit hash that you need
git rebase -i <commit hash> - rebase interactively, choosing edit for the option
git reset HEAD~ - which is similar to git reset .

do your things here and then
git rebase --continue
