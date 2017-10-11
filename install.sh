#!/bin/sh

ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.alias ~/.alias
ln -sf ~/dotfiles/.emacs.d ~/.emacs.d
mkdir -p ~/bin
cp ~/dotfiles/bin/gcmt ~/bin/gcmt
chmod +x ~/bin/gcmt

echo "done."
