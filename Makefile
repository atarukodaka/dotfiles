
BINDIR = ~/bin

init:
	ln -sf ${PWD}/.bashrc ~/
	ln -sf ${PWD}/.gitconfig ~/
	ln -sf ${PWD}/.alias ~/
	ln -sf ${PWD}/.pryrc ~/
	ln -sf ${PWD}/.colorrc ~/
	ln -sf ${PWD}/.vimrc ~/

	mkdir -p ${BINDIR}
	cp ${PWD}/bin/gcmt ${BINDIR}
	chmod +x ${BINDIR}/gcmt

emacs:
	rm -f ~/.emacs.d
	ln -sf ~/dotfiles/.emacs.d ~/.emacs.d

	curl -fsSkL https://raw.github.com/cask/cask/master/go | python
	(cd ~/dotfiles/.emacs.d; cask init; cask install)

	mkdir -p ${BINDIR}
	cp ./bin/mozc_emacs_helper.sh ${BINDIR}/
	chmod +x ${BINDIR}/mozc_emacs_helper.sh

