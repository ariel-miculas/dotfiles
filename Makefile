.PHONY:install all dotfiles default

default:
	@echo "Please specify {arch|debian}"

arch:
	./install/arch/install.sh

debian:
	./install/debian/install.sh

dotfiles:
	stow -v -R -t ~ vim bash git tmux input zsh
