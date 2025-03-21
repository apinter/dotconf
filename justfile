# Help: This is a Justfile for managing my system
default:
    @just --list --unsorted

# Setup Aeon host system
host-setup:
  mkdir -p ~/Project/git; \
  cd ~/Project/git && git clone https://github.com/apinter/up-and-running.git -b microos
  cd up-and-running && anible-playbook up-and-running.yml
  ln -s $HOME/Project/git/dotconf/fish $HOME/.config/fish
  ln -s $HOME/Project/git/dotconf/.gitconfig $HOME/.config/.gitconfig
  ln -s $HOME/Project/git/dotconf/vim/vim $HOME/.vim
  ln -s $HOME/Project/git/dotconf/vim/vimrc $HOME/.vimrc
  ln -s $HOME/Project/git/dotconf/fonts $HOME/.local/share/fonts/
  ln -s $HOME/Project/git/dotconf/ranger $HOME/.config/ranger
  ln -s $HOME/Project/git/dotconf/zathura $HOME/.config/zathura
  ln -s $HOME/Project/git/dotconf/bat $HOME/.config/bat
  ln -s $HOME/Project/git/dotconf/kitty/ $HOME/.config/kitty

# Install brew packages
brew-init:
  brew install bat \
    berkeley-db@5 \
    binutils \
    bzip2 \
    ca-certificates \
    cosign \
    expat \
    eza \
    fd \
    fzf \
    gcc \
    gh \
    glab \
    glances \
    gmp \
    helm \
    isl \
    jansson \
    just \
    krb5 \
    kubernetes-cli \
    lazygit \
    libedit \
    libevent \
    libffi \
    libgit2 \
    libmpc \
    libnsl \
    libssh2 \
    libtirpc \
    libxcrypt \
    lz4 \
    mpdecimal \
    mpfr \
    mtr \
    ncurses \
    oniguruma \
    openssl@3 \
    python@3.12 \
    readline \
    sqlite \
    terraform \
    tmux \
    unzip \
    utf8proc \
    xz \
    yazi \
    zlib \
    zoxide \
    zstd

# Clean up system
clean:
  podman image prune -a -f
  podman container prune -f
  flatpak --user uninstall --unused

# Create an openSUSE container
distrobox-opensuse:
  echo 'Creating openSUSE distrobox ...'
  distrobox create -n tw --image registry.opensuse.org/opensuse/tumbleweed --additional-flags "--pids-limit -1" -Y

# Setup openSUSE container
distrobox-opensuse-setup:
  sudo zypper ref && sudo zypper dup -y
  cd $HOME/Project/git/dotconf && bash toolbox-setup.sh

# Create a Fedora container
distrobox-fedora:
  echo 'Creating Fedora distrobox ...'
  distrobox create -n fedora --image quay.io/fedora/fedora:38 --additional-flags "--pids-limit -1" -Y

# Create an Arch container
distrobox-arch:
  echo 'Creating Arch distrobox ...'
  distrobox create -n arch --image docker.io/arch:latest -Y --additional-flags "--pids-limit -1"

# Setup Arch container
distrobox-arch-setup:
  sudo pacman -Syyu
  sudo pacman -S base-devel git pipewire pipewire-pulse gnome-keyring
  cd $HOME/Project/git && git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si

# Create a Debian container
distrobox-debian:
  echo 'Creating Debian distrobox ...'
  distrobox create -n debian --image docker.io/debian --additional-flags "--pids-limit -1" -Y

# Create an Ubuntu container
distrobox-ubuntu:
  echo 'Creating Ubuntu distrobox ...'
  distrobox create -n ubuntu --image docker.io/ubuntu:22.04 --additional-flags "--pids-limit -1" -Y

# Update system, flatpaks, and containers all at once
update:
  flatpak upgrade --user -y
  distrobox upgrade -a
  brew upgrade

# Update some pip packages
pip-update:
  pip install --upgrade pip ansible glances yt-dlp

# Update systems
fleet-update:
  cd $HOME/Project/git/system-updater && ansible -i inventory TW -m ping 
  cd $HOME/Project/git/system-updater && ansible-playbook -i inventory system_updater.yml

# Install syft and grype for vulnerability scanning
vuln-scan-setup:
  mkdir $HOME/bin; \
  curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b $HOME/bin
  curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b $HOME/bin

# Update grype databases
grype-db-update:
  grype db status
  grype db update

# encrypt quadlets
qencrypt:
  ansible-vault encrypt ./quadlets/rootless/*.yml

# decrypt quadlets
qdecrypt:
  ansible-vault decrypt ./quadlets/rootless/*.yml

# bw backup
bw-backup:
  bash $HOME/Vaults/Knox/bw_bk.sh

# Set Kitty terminfo on remote
ks target:
  infocmp -a xterm-kitty | ssh {{target}} tic -x -o \~/.terminfo /dev/stdin

# Check k3s versions
k3s-version channel:
  curl -L https://update.k3s.io/v1-release/channels | jq '.data[] | select(.id == "{{ channel }}")'

# Setup Fisher and Tide
fisher-setup:
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher install IlanCosman/tide@v6

