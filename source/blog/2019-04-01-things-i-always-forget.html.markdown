---

title: things-i-always-forget
date: 2019-04-01 23:36 UTC
tags: 
published: false

---

## Set up a key for no pass prompt on school servers
  1. generate ssh-key using: 
  `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
  2. add the id_rsa.pub to the remote server .ssh folder in a file name authorized_keys


