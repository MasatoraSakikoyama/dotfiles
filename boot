#!/bin/bash
# install
brew update
brew upgrade
brew install zsh zsh-git-prompt nvim tmux git reattach-to-user-namespace

# change login shell
sed -i -e 's#\$#/usr/local/bin/zsh#' /etc/shells
chsh -s /usr/local/bin/zsh

# create sym link
ln -s .config ~/.config
ln -s .gitconfig ~/.gitconfig
ln -s .tmux.conf ~/.tmux.conf
ln -s .zsh ~/.zsh
ln -s .zshrc ~/.zshirc
