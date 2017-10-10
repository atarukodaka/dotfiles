#!/bin/sh

ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.alias ~/.alias
ln -sf ~/dotfiles/.emacs.d ~/.emacs.d
cp ~/dotfiles/bin/gcmt ~/bin/gcmt
chmod +x ~/bin/gcmt
