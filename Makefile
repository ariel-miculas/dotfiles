install:
	./install.sh

all: install dotfiles

dotfiles:
	stow -n -v -R -t ~ vim bash git
