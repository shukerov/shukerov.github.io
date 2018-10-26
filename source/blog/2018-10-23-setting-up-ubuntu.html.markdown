---

title: setting-up-ubuntu
date: 2018-10-23 05:48 UTC
tags: 
published: false
---

# Installing chrome:
    
  ```bash
  sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install libxss1 libappindicator1 libindicator7
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
  ```

# Installing spotify:
  # 1. Add the Spotify repository signing keys to be able to verify downloaded packages
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

  # 2. Add the Spotify repository
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

  # 3. Update list of available packages
  sudo apt-get update

  # 4. Install Spotify
  sudo apt-get install spotify-client

  for proper scaling on HiDPI
  subl /usr/share/applications/spotify.desktop  and add `--force-device-scale-factor=1.5 %U` after the exec field

# Installing gnome-tweak-tool:
  sudo apt-get install gnome-tweak-tool
  # centers the gnome menu... you need a few more thingies
  gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Installing vim:
  sudo apt install vim

# Installing tmux:
  sudo apt-get update
  sudo apt install tmux

# Installing vlc:
  sudo apt-get update
  sudo apt install vlc

# Install discord:
  debian package online...

# Install xclip:
  sudo apt-get install xclip
  check this: https://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard

# Get the Yaru theme for Ubuntu:


# Dual boot tweaks:
##  FIX TIMES FOR DUAL BOOT:
  http://ubuntuhandbook.org/index.php/2016/05/time-differences-ubuntu-1604-windows-10/
  You can do this by either switching windows to local time or ubuntu to local time. I chose ubuntu. One of the ways
  to achieve the time to local time is by running:

  `timedatectl set-local-rtc 1 --adjust-system-clock`

  To check if the change is successful you can run, and look for a warning at the bottom, of the output:
  `timedatectl`

##  FIX GRUB MENU UP A BIT:

## Auto-mounting a shared windows partition:
  `sudo fdisk -l` lists all partitions
  what i was looking for
  /dev/nvme0n1p7 1040324608 2000406527 960081920 457.8G Microsoft basic data

  `sudo blkid` lists all partition 
  /dev/nvme0n1p7: LABEL="Data" UUID="0CD48544D48530CE" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="ba198c5a-a4a5-4a24-9376-575eb7acca6e"

  NTFS
  `UUID=0CD48544D48530CE /media/data ntfs uid=1000,gid=1000,umask=0022,sync,auto,rw 0 0`

  UUID=<uuid> <pathtomount> ntfs uid=<userid>,gid=<groupid>,umask=0022,sync,auto,rw 0 0
  Examples for the <> variables:
  <uuid>=3087106951D2FA7E
  <pathtomount>=/home/data/
  <userid>=1000
  <groupid>=1000
  Use id -u <username> to get the userid and id -g <username> to get the groupid.

  (Note that specifying the sync option can slow down write performance as it disables the cache. async is the default.)

  open /etc/fstab and add it there. 

  source: https://askubuntu.com/questions/164926/how-to-make-partitions-mount-at-startup
  more info here:
  http://www.linuxstall.com/fstab/


# Installing and configuring git:
    sudo apt-get install git
    sudo apt-get update
    git config --global user.name "Stoyan Shukerov"
    git config --global user.email "stoichik@gmail.com"
    git config --global core.editor "vim"
    git config core.filemode false -> ignores file modes

# Getting ssh to work again:
  Copy over your backed up ssh-keys to ~/.ssh/
  Run `ssh-add` to add your keys to the ssh-agent
  If you get an error for "too open permissions", run the following command to change them
  `chmod 400 ~/.ssh/id_rsa`

# Alt and tab fastswitch:
## Where to get the extension:
  https://extensions.gnome.org/extension/1317/alt-tab-switcher-popup-delay-removal/
## Loading gnome extensions manually:
  https://itsfoss.com/gnome-shell-extensions/


