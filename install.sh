#!/bin/bash


DOTHOME="$HOME/.dotfiles"
# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
	ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
	RED="$(tput setaf 1)"
	GREEN="$(tput setaf 2)"
	YELLOW="$(tput setaf 3)"
	BLUE="$(tput setaf 4)"
	BOLD="$(tput bold)"
	NORMAL="$(tput sgr0)"
else
	RED=""
	GREEN=""
	YELLOW=""
	BLUE=""
	BOLD=""
	NORMAL=""
fi
# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e


# @param {string} $1 - program to check
checkInstall() {
	CHECK_INSTALLED=$(grep /"$1"$ /etc/shells | wc -l)
	if [ ! $CHECK_INSTALLED -ge 1 ]; then
		printf "${YELLOW}$1 is not installed!${NORMAL} Please install $1 first!\n"
		exit
	fi
	unset CHECK_INSTALLED
}

gitInstall() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

}

init() {
	sudo apt-get update
	sudo apt-get upgrade

	CHECK_LIST="curl wget zsh vim gvim git tmux"

	INSTALL_LIST="curl wget terminator zsh vim-python-jedi git tmux irssi"

	sudo apt-get -y install $INSTALL_LIST

	mkdir -p $HOME/.vim

	gitInstall

	for item in $(seq 1 $CHECK_LIST); do
		checkInstall "$item"
	done
}

config() {
	ln -f "$DOTHOME"/git/.gitconfig $HOME/.gitconfig
	git config --global --unset-all core.editor
	git config --unset-all core.editor
	git config --global core.editor "gvim -f"

	mkdir -p $HOME/.vim/tmp/backup
	mkdir -p $HOME/.vim/tmp/swap
	mkdir -p $HOME/.vim/tmp/undo
	ln -f "$DOTHOME"/vim/vimrc $HOME/.vim/vimrc
	ln -f $HOME/.vim/vimrc $HOME/.vimrc

	mkdir -p $HOME/.config/terminator
	ln -f "$DOTHOME"/terminator/config $HOME/.config/terminator/config

	ln -f "$DOTHOME"/tmux/.tmux.conf $HOME/.tmux.conf

	mkdir -p $HOME/.irssi/config
	ln -f "$DOTHOME"/irssi/config $HOME/.irssi/config
	ln -f "$DOTHOME"/irssi/mrrobot.theme $HOME/.irssi/mrrobot.theme

	mkdir -p $HOME/.zsh/
	ln -f "$DOTHOME"/zsh/hack.zsh-theme $HOME/.oh-my-zsh/themes/hack.zsh-theme
	ln -f "$DOTHOME"/zsh/pyzhon.zsh-theme $HOME/.oh-my-zsh/themes/pyzhon.zsh-theme
	ln -f "$DOTHOME"/zsh/.zshrc $HOME/.zsh/.zshrc
	ln -f $HOME/.zsh/.zshrc $HOME/.zshrc
	ln -f "$DOTHOME"/zsh/.aliases $HOME/.zsh/.aliases
	ln -f "$DOTHOME"/zsh/.directory $HOME/.zsh/.directory
}

main() {
	init

	git clone https://github.com/jorgechato/.dotfiles.git "$DOTHOME"

	config

	printf "${GREEN}"
	echo 'https://github.com/jorgechato/.dotfiles ....is now installed!'
	echo ''
	echo ''
	echo 'p.s. Follow me at https://twitter.com/jorgechato.'
	echo ''
	printf "${NORMAL}"
}

main
