#!/bin/bash

set -e

## Add repo for VSCode
sudo zypper in -y openssl curl
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-#md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/#zypp/repos.d/vscode.repo'

## Add repo for Brave
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper addrepo --refresh https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser

## Install packages
sudo zypper ref
sudo zypper in -y -t pattern devel_C_C++ devel_basis devel_python3
sudo zypper in -y brave-browser code vim python38 python38-devel python38-pip kitty alacritty fish zsh ripgrep opi ffmpeg mlocate sshpass cryfs wireguard-tools pwgen htop kubernetes1.23-client k9s go bat git openssh-common openssh-clients

## Install PyPi packages
pip install ansible ansible-vault ara google-auth pymongo

## Install OMF
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

## Install logo-ls
cd $HOME/Project/git/ && curl -LO https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_amd64.rpm
sudo zypper in -y logo-ls_amd64.rpm

