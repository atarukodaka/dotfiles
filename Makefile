
BINDIR = ~/bin

init:
	ln -sf ~/dotfiles/.bashrc ~/.bashrc
	ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/dotfiles/.alias ~/.alias
	ln -sf ~/dotfiles/.pryrc ~/.pryrc

emacs:
	rm -f ~/.emacs.d
	ln -sf ~/dotfiles/.emacs.d ~/.emacs.d

	curl -fsSkL https://raw.github.com/cask/cask/master/go | python
	(cd ~/dotfiles/.emacs.d; cask init; cask install)

	mkdir -p ${BINDIR}
	cp ~/dotfiles/bin/ ${BINDIR}/
	chmod +x ${BINDIR}/gcmt ${BINDIR}/mozc_emacs_helper.sh

