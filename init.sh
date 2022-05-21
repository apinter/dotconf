!#/bin/bash

## Install plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Install oh-my-fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

## Install Fish packages
omf install git@github.com:aliz-ai/google-cloud-sdk-fish-completion.git
omf install bass
omf install bobthefish
