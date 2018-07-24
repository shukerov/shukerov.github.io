---
title: Ruby Development Windows 10
date: 2018/03/22
tags: bash, windows 10, rbenv, ubuntu, ruby, windows, blog
---

Dual booting my machine has been the way to go for me for the last year, but switching between ubuntu and windows 10 has become pretty tiring. I love ubuntu, but it doesn't
play nicely with my laptop (terrible battery life and not so great high dpi monitor support). This is why I will be trying to run things on the beta feature bash in windows 10.
First main goal is to set up development for this very blog. I will need ruby and middleman (along with some other things I am guessing). This blog post will cover how to set up
ruby with rbenv to manage versions in bash on windows! Lets get started!

Firstly we will install rbenv to manage ruby versions. There are several alternatives here rvm or just a plain ruby install. Since we will be focusing on installation with rbenv we need a clone of the following repo: https://github.com/rbenv/rbenv

*this is a very useful read that basically contains a longer version of what we are about to do. If you want some understanding of how rbenv manages versions read the how it works section of the README in the repo
linked above (I found it quite interesting).* (edit this a bit)

First we will install some dependencies for ruby (and ruby on rails):

```bash
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev
libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev
python-software-properties libffi-dev
```

Clone the repo provided above in your home directory by running the command below:

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

DIRECTLY FROM REPO: Optionally, try to compile dynamic bash extension to speed up rbenv. Don't worry if it fails; rbenv will still work normally:

```bash
cd ~/.rbenv && src/configure && make -C src
```

Next we will add the rbenv folder to the $PATH variable of the system. Note that I am using .mybashrc, depending on your setup you might want to echo it in your .bashrc or .bash_profile.

```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.mybashrc
echo 'val "$(rbenv init -)"' >> ~/.mybashrc
```

Restart you shell to reaload .bashrc

```bash
exec $SHELL
```

Next we will install the ruby build plugin that is recommended with rbenv. This will let us easily install new ruby versions:

```bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.mybashrc
exec $SHELL
```

Finally we will install the ruby version, at the time of writing the most stable release is ruby 2.5.0:

```bash
rbenv install 2.5.0
```

Set the system wide version of ruby by running the following command:

```bash
rbenv global 2.5.0
```

Check if everything went smoothly. If it did then the next command should yield 2.5.0

```bash
ruby -v
```

Install some global gems that we will need

```bash
gem install bundler
gem install middleman
gem install rails
```

To "activate" new gems run:

```bash
rbenv rehash
```