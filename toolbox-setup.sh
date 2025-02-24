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

## Install Nix
#curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes
## Install home-manager
#nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
#nix-env -i home-manager

## Install packages
sudo zypper ref
sudo zypper in -t pattern devel_C_C++ devel_basis devel_python3
sudo zypper in Mesa microsoft-edge-beta \
  tmux ranger pinentry-gnome3 \
  fontawesome-fonts font-manager \
  fira-code-fonts font-manager \
  brave-browser code-insiders vim \
  python313 python313-devel python313-pip \
  kitty alacritty fish zsh ripgrep opi \
  ffmpeg mlocate sshpass cryfs \
  wireguard-tools pwgen htop neovim \
  command-not-found kubernetes1.24-client \
  kubectx go git openssh-common \
  openssh-clients nodejs-common npm \
  xdg-desktop-portal-gnome xdg-desktop-portal-wlr \
  xdg-dbus-proxy xdg-desktop-portal-gtk \
  xdg-desktop-portal-wlr xdg-user-dirs \
  xdg-user-dirs-gtk pinentry bind-utils \
  noisetorch qrencode unzip zip \
  apache2-utils wine jq \
  fd fzf gnome-keyring zellij \
  zoxide yazi difftastic \
  broot dust eza yq

echo -n "" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install gh just \
  k9s bat zellij yazi broot dust

/home/linuxbrew/.linuxbrew/bin/brew tap hashicorp/tap &&
  home/linuxbrew/.linuxbrew/bin/brew install hashicorp/tap/terraform

## Install GUI app dependencies
sudo zypper install adwaita-icon-theme xorg-x11-fonts libX11-xcb1 gsettings-desktop-schemas gdk-pixbuf-query-loaders
sudo gdk-pixbuf-query-loaders-64 --update-cache

## Install PyPi packages
pip install ansible ansible-vault ara pymongo

## Install OMF
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
