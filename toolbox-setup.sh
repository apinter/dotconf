#!/bin/bash

set -e

code_repo=$(sudo zypper lr | grep code | awk '{print $3}')
brave_repo=$(sudo zypper lr | grep brave | awk '{print $3}')
edge_repo=$(sudo zypper lr | grep edge | awk '{print $3}')
sudo zypper in openssl curl

if [ "$code_repo" ]; then
	echo "VSCode repo is already present"
else
	## Add repo for VSCode
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
		sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-#md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
fi

if [ "$edge_repo" ]; then
	echo "MSEdge repo is already present"
else
	## Add repo for VSCode
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
		sudo zypper ar https://packages.microsoft.com/yumrepos/edge microsoft-edge-beta
fi

if [ "$brave_repo" ]; then
	echo "Brave repo is already present"
else
	## Add repo for Brave
	sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc &&
		sudo zypper addrepo --refresh https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser
fi

## Install packages
sudo zypper ref
sudo zypper in -t pattern devel_C_C++ devel_basis devel_python3
sudo zypper in Mesa microsoft-edge-beta \
	tmux ranger pinentry-gnome3 \
	fontawesome-fonts font-manager \
	fira-code-fonts font-manager \
	brave-browser code-insiders vim \
	python38 python38-devel python38-pip \
	kitty alacritty fish zsh ripgrep opi \
	ffmpeg mlocate sshpass cryfs \
	wireguard-tools pwgen htop neovim \
	command-not-found kubernetes1.24-client \
	kubectx k9s go bat git openssh-common \
	openssh-clients nodejs-common npm \
	xdg-desktop-portal-gnome xdg-desktop-portal-wlr \
	xdg-dbus-proxy xdg-desktop-portal-gtk \
	xdg-desktop-portal-wlr xdg-user-dirs \
	xdg-user-dirs-gtk pinentry bind-utils \
	noisetorch qrencode unzip zip \
	apache2-utils wine jq \
	terraform fd fzf gnome-keyring

## Install GUI app dependencies
sudo zypper install adwaita-icon-theme xorg-x11-fonts libX11-xcb1 gsettings-desktop-schemas gdk-pixbuf-query-loaders
sudo gdk-pixbuf-query-loaders-64 --update-cache

## Install PyPi packages
pip install ansible ansible-vault ara google-auth pymongo

## Install logo-ls
cd $HOME/Project/git/ && curl -LO https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_amd64.rpm
sudo zypper in $HOME/Project/git/logo-ls_amd64.rpm

## Install OMF
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
