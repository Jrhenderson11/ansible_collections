# Ansible collections

A repo to host installable playbooks and roles for common setups

## Collections

Linux:
 - desktop: An i3 based desktop with a bar, oh-my-zsh and custom dotfiles
 - utils: A wide variety of Linux utilities
 - security: Secutity specific tooling, separated by category

Each collection has an `all.yml` playbook which installs all roles

## Requirements

 - ansible
 - root permisions on target system

Ansible galaxy requirements:
`ansible-galaxy install -r requirements.yml`


## Install local collections

```sh
ansible-galaxy collection install ./desktop
ansible-galaxy collection install ./utils
ansible-galaxy collection install ./security
```

## Run playbooks

```sh

# Check inventory
ansible --list-hosts -i localhost
ansible-playbook foo.yml --check

# Run playbook
ansible-playbook -i inventory hendo.desktop.all all

# Run role specificed by tag
ansible-playbook hendo.desktop.all all -i inventory --tag zsh

```


## Editing

```sh
mkdir -p {desktop,utils,security}/{roles}

function mkrole() {
	mkdir -p roles/$1/tasks
	s roles/$1/tasks/main.yml
}

```

## todo

improve checks before installing

# metasploit
# metasploit_url: "https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb"
# metasploit_user: root
# metasploit_msfdb: False

dunst desktop
NetworkManager-gnome
blueman-applet

aws
az cli

tldr
powerline prompt

trufflehog
scoutsuite
katana
dnsrecon

iw
hackrf radio
aircrack

hotspot?

smbmap etc

bloodhound.py

crunch

# sliver

# WINDOWS!



tldr

prompt



Windows:
 - desktop
 - security
 - dev
 - reverse