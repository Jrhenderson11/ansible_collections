# Ansible collections

A repo to host installable playbooks and roles for common setups

## Collections

Linux:
 - desktop: An i3 based desktop with a bar, oh-my-zsh and custom dotfiles
 - utils: A wide variety of Linux utilities
 - security: Secutity specific tooling, separated by category

Windows:
 - base: WinglazeWM for tiling, powershell profile, openssh server + some useful apps
 - security: security specific tools
 - malware: tools for checking malicious software

Each collection has an `all.yml` playbook which installs all roles

## Requirements

 - ansible
 - root/Administrator permisions on target system

Ansible galaxy requirements:
`ansible-galaxy install -r requirements.yml`


## Install local collections

```sh
cd linux
ansible-galaxy collection install ./desktop
ansible-galaxy collection install ./utils
ansible-galaxy collection install ./security

cd windows
ansible-galaxy collection install ./base
ansible-galaxy collection install ./security
ansible-galaxy collection install ./malware
```

## Run playbooks

```sh

# Check inventory
ansible --list-hosts -i localhost
ansible-playbook foo.yml --check

# Run playbook
# ansible-playbook -i <inventory> <namespace.collection.playbook> <subgroup_of_inventory>
ansible-playbook -i inventory hendo.linux_desktop.all
ansible-playbook -i inventory hendo.linux_utils.all
ansible-playbook -i inventory hendo.linux_security.all

ansible-playbook -i inventory hendo.windows_base.all
ansible-playbook -i inventory hendo.windows_security.all
ansible-playbook -i inventory hendo.windows_malware.all

# Run / skip role specificed by tag
ansible-playbook hendo.linux_desktop.all -i inventory --tag zsh
ansible-playbook hendo.linux_desktop.all -i inventory --skip-tags zsh

```

Windows:
```sh
# additional dependency
pip install "pywinrm>=0.3.0"

# Create inventory (assumes WinRM)
export IP='192.168.56.21'

export user="hendo"
read -s pass"?Enter password:"

cat > inventory.yml << EOF
all:
  hosts:
    vm:
      ansible_host: $IP
      ansible_user: $user
      ansible_password: $pass
      ansible_connection: winrm
      ansible_winrm_transport: ntlm
      ansible_winrm_port: 5985
EOF

ansible-playbook -i inventory.yml hendo.windows_base.all

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

with profile:
Install-Module -Name PSReadLine -Force -SkipPublisherCheck

```
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle Inline
Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[90m" } # Gray color

```
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

```
$settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"
$settings = Get-Content -Path $settingsPath -Raw | ConvertFrom-Json

$newKeyBinding = @{
    command = "closeTab"
    keys    = "ctrl+w"
}

$settings.actions += $newKeyBinding
$settings | ConvertTo-Json -Depth 32 | Set-Content -Path $settingsPath -Force


```

ZEBAR defender

hide desktop apps

improve checks before installing

<!-- # metasploit
# metasploit_url: "https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb"
# metasploit_user: root
# metasploit_msfdb: False
 -->

dunst desktop
blueman-applet

firefox extensions
https://github.com/mozilla/policy-templates/blob/master/README.md

```json
{
  "policies": {
  	"FirefoxHome": {
      "Search": true,
      "TopSites": true,
      "SponsoredTopSites": false,
      "Highlights": false,
      "Pocket": false,
      "SponsoredPocket": false,
      "Snippets": false,
      "Locked": true
    },
    "ExtensionSettings": {
      
      "multi-account-containers@mozilla"
      "uBlock0@raymondhill.net": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      },
      "adguardadblocker@adguard.com": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/adguardadblocker@adguard.com/latest.xpi"
      },
      "https-everywhere@eff.org": {
        "installation_mode": "allowed",
        "updates_disabled": false
      }
    }
  }
}
```

# windows

https://community.chocolatey.org/packages/Sudo
sudo config --enable inline

az cli

tldr
powerline prompt
time in prompt

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

ldapdomaindump + ldap2json
pywerview
chisel

## C2
havok / sliver

## Windows
PECloak
gping (choco)
mingw

supernova
 - PE:
    - https://github.com/petoolse/petools
    - explorer suite https://ntcore.com/?page_id=388

 - mailsniper
 - rubeus
 - seatbelt
 - powerview
 - sharpersist
 - sharpup
jre8

ghostpack? obfuscated?

### DEFENDER ZEBAR

 - uses inbuilt providers +js written bars: hard

### msys64 tools?

https://www.msys2.org/
https://packages.msys2.org/base


{{ ansible_user_dir }}/.glzr/zebar
{{ ansible_user_dir }}\.glzr\glazewm\config.yaml
https://github.com/glzr-io/glazewm/blob/main/resources/assets/sample-config.yaml
glazewm:
 - smaller gaps?

disble UAC

https://github.com/steaksauce-/Ansible-Playbooks/blob/master/Windows/win-disable-remoteuac.yml


powershell prompt w/date

Pinned to taskbar:
 - terminal
 - firefox
 - sublime

TaskbarLayoutModification.xml 

C:\WIndows\OEM\TaskbarLayoutModification.xml

```xml

```


Terminal:

$$

diceware
https://github.com/mermaid-js/mermaid-cli
hcxtools
macchanger
python3-virtualenv
hydra (pw-inspector)

AALIASES:
https://github.com/dandavison/delta

avred
yetanotherobfuscator

ilspy
dnspi
yara

SSH windows
Get-Service -Name ssh-agent | Set-Service -StartupType Manual