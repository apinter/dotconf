!#/bin/bash

AtomPackages()
{apm stars --user apinter --install
}

zshIN()
{
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir -p ~/Project/git; git clone https://github.com/apinter/dotconf.git ~/Project/git/
}

ansibleIN()
{
sudo pip install ansible ansible-vault
}

vscIN()
{
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper ref; sudo zypper in -y code
}

vimSETUP()
{
cp -rf ~/Project/git/dotconf/vim/.* ~/  
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     "    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim    
}

AtomPackages;
zshIN;
ansibleIN;
vscIN;