.PHONY:install all dotfiles default arch arch_stow

default:
	@echo "Please specify {arch|debian}"

arch: arch_stow dotfiles arch_install

arch_install:
	cd install/arch && ./install.sh

arch_stow:
	sudo pacman -S stow

debian:
	cd install/debian && ./install.sh

dotfiles:
	stow -v -R -t ~ vim git tmux input zsh neomutt
