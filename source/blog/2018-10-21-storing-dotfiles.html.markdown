---

title: Storing and Maintaining Dotfiles
date: 2018-10-21 16:50 UTC
tags: ubuntu, dotfiles, git, setup, dual-boot
---

I have been looking for a way to store my dotfiles for some time now. The ideal solution was supposed to be simple, elegant, easy to implement and flexible. I finally came across such a solution, it is the setup that `SneakyCobra` had on HackerNews, you can read his post [here](https://news.ycombinator.com/item?id=11071754). The only prerequisite is some basic git knowledge, and optionally a little bit of shell scripting experience.

This method of storing dotfiles consists of a bare git repository that lives in your home folder and a git alias that runs commands against that specific git repository.

# First Time Setup
## Create the Git Repository for Dotfiles
All configuration (dotfiles) will be stored in the git repo. The commands below initialize the empty repository and create an alias that will be used to store more dotfiles later.

```bash
# initialize empty repo
git init --bare $HOME/.myconfig

# NOTE: redirect in my case is to .bash_aliases. This will most likely be different for you
# adds config alias to your existing base of aliases
echo "alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'" >> $HOME/.bash_aliases

# make sure your repo ignores untracked files
config config --local status.showUntrackedFiles no
```

## Adding Your Dotfiles
Next I will add my dotfiles to the repo that was just created. If you are familiar with git then you already know what to do, I added and commited the following files

```bash
config add .vimrc
config add .bash_aliases
config add .mybashrc
config add .tmux.conf
config add .gitconfig
config commit -m 'Initializing repository. Add config files.'
```

Create a repository on your favorite git hosting service, point your repo to it and then push your changes. 

```bash
config remote add origin <yourgithostinglink>
config push --set-upstream origin master
```

# Migrating Setup to a Different Machine

Now that I have done the initial setup, its time to try it out in action. Since I have dual booted my machine I will try it out on the Linux subsystem for `Windows`.

To make the process easier I have created a github snippet, to automatically complete migration steps. The shell script does the following:

1. Clones the config repo created.
2. Checkouts the content from to bare repository to my home directory.
  *Note that the checkout might fail, if there are some stock configuration files. The shell script creates a backup folder in that case.*
3. Adds `.mybashrc` to the user bashrc (I keep those separate, to avoid unnecessary mixups).

And here are the contents of the script, credit goes to [Nicola Paolucci](https://www.durdn.com/):

```bash
git clone --bare git@github.com:shukerov/myconfig.git $HOME/.myconfig
function config {
   /usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME $@
}
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .config-backup
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

echo -e "\nif [ -f ~/.mybashrc ]; then \n. ~/.mybashrc\nfi\n" >> .bashrc
```

I run the script above with a curl command

```bash
curl -Lks https://gist.githubusercontent.com/shukerov/d90c001818f90ac7e9b0fe31992bae3a/raw/5915a4cc2b93e3653279491c920331913afe5cb1/shukerov-config-install | /bin/bash
```

Your dotfiles should now be successfully migrated!
