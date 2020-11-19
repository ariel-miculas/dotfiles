.PHONY:install all dotfiles
install:
	./install.sh

all: install dotfiles

dotfiles:
	stow -v -R -t ~ vim bash git tmux input zsh
