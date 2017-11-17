
BINDIR = ~/bin

init:
	rm ~/.emacs.d
	ln -sf ~/dotfiles/.bashrc ~/.bashrc
	ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/dotfiles/.alias ~/.alias
	ln -sf ~/dotfiles/.emacs.d ~/.emacs.d
	ln -sf ~/dotfiles/.pryrc ~/.pryrc

	mkdir -p ${BINDIR}
	cp ~/dotfiles/bin/gcmt ${BINDIR}/gcmt
	chmod +x ${BINDIR}/gcmt

