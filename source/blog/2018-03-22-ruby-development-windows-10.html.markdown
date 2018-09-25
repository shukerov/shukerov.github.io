---
title: Ruby Development Ubuntu 18.04
date: 2018/03/22
tags: bash,rbenv,ubuntu,ruby
---

This blog post will cover how to set up ruby with rbenv to manage versions in bash on Ubuntu. Note that this also works for the Ubuntu subsystem provided on windows. By installing rbenv you will be able to have application-specific Ruby versions. You will be able to quickly switch between them, and avoid a messy ruby environment. Another popular solution to the same problems is rvm.

Before we get started I would like to note that the [source](https://github.com/rbenv/rbenv) for this blogpost is the rbenv github repository.

#### Lets get started!

First we will install some dependencies for ruby (and ruby on rails):

```bash
sudo apt-get install curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev
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
echo 'eval "$(rbenv init -)"' >> ~/.mybashrc
```

Restart you shell to reaload .bashrc

```bash
exec $SHELL
```

You can then execute a script called rbenv-doctor which checks that rbenv is set properly. To do that just execute the following statement:

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

You will notice that there are currently no ruby versions installed. We will take care of next by installig a ruby build plugin for rbenv. Doing this will let us install ruby versions very easily by just running `rbenv install <ruby version here>`.

```bash
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

Now we can proceed to installing ruby. I went with the latest ruby version but feel free to install the one you need:

```bash
# this command will list all available ruby versions
rbenv install -l

# this command will install ruby 2.5.1
rbenv install 2.5.1
```

Set the system wide version of ruby by running the following command:

```bash
rbenv global 2.5.1
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

#### Additional notes

If you plan to use middleman or ruby on rails you will need a javascript runtime. You can find a list of them [here](https://github.com/rails/execjs):

I personally went with nodejs. You can download and install the LTS version of node by running:

```bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs
```
