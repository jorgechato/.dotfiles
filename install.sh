#!/bin/bash


if [ "$(uname)" == "Darwin" ]; then
	OS="mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	OS="linux"
else
	OS=""
fi

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
	if [ $OS == "mac" ]; then
		CHECK_INSTALLED=$(which "$1" | grep -v not | wc -l)
	elif [ $OS == "linux" ]; then
		CHECK_INSTALLED=$(grep /"$1"$ /etc/shells | wc -l)
	fi

	if [ ! $CHECK_INSTALLED -ge 1 ]; then
		printf "${YELLOW}$1 is not installed!${NORMAL} Please install $1 first!\n"
		exit
	fi
	unset CHECK_INSTALLED
}

gitInstall() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

init() {
	if [ $OS == "mac" ]; then
		init_mac
	elif [ $OS == "linux" ]; then
		init_linux
	fi
}

init_mac() {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	sh -c "$(curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh)"

	INSTALL_LIST="zsh macvim git tree irssi nmap nvm jenv fortune kubectl ack"
	INSTALL_LIST_CASK="iterm2 java"

	echo "Installing ($INSTALL_LIST)..."

	brew install $INSTALL_LIST
	brew cask install $INSTALL_LIST_CASK

	gitInstall

	CHECK_LIST="zsh mvim git tree irssi nmap"

	for item in $CHECK_LIST; do
		checkInstall "$item"
	done
}

init_linux() {
	sudo apt-get update
	sudo apt-get upgrade

	sh -c "$(curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh)"

	CHECK_LIST="curl wget zsh vim gvim git tmux"

	INSTALL_LIST="curl wget terminator zsh vim-python-jedi git tmux irssi"

	echo "Installing ($INSTALL_LIST)..."

	sudo apt-get -y install $INSTALL_LIST

	gitInstall

	for item in $(seq 1 $CHECK_LIST); do
		checkInstall "$item"
	done
}

config() {
	echo "System configuration..."

	ln -f "$DOTHOME"/git/.gitconfig $HOME/.gitconfig

	if [ $OS == "linux" ]; then
		cp -f -R "$DOTHOME"/fortune/* /usr/share/games/fortunes/
	elif [ $OS == "mac" ]; then
		fortuneV=$(fortune -V 2>&1 | sed -n 2p | cut -d' ' -f 3)
		cp -f -R "$DOTHOME"/fortune/* /usr/local/Cellar/fortune/$fortuneV/share/games/fortunes/
	fi

	if [ $OS == "linux" ]; then
		git config --global --unset-all core.editor
		git config --unset-all core.editor
		git config --global core.editor "gvim -f"
	fi

	mkdir -p $HOME/.vim/tmp/backup
	mkdir -p $HOME/.vim/tmp/swap
	mkdir -p $HOME/.vim/tmp/undo
	ln -f "$DOTHOME"/vim/vimrc $HOME/.vim/vimrc
	ln -f $HOME/.vim/vimrc $HOME/.vimrc

	if [ $OS == "linux" ]; then
		mkdir -p $HOME/.config/terminator
		ln -f "$DOTHOME"/terminator/config $HOME/.config/terminator/config

		ln -f "$DOTHOME"/tmux/.tmux.conf $HOME/.tmux.conf
	fi

	mkdir -p $HOME/.irssi/config
	ln -f "$DOTHOME"/irssi/config $HOME/.irssi/config
	ln -f "$DOTHOME"/irssi/mrrobot.theme $HOME/.irssi/mrrobot.theme

	mkdir -p $HOME/.zsh/
	ln -f "$DOTHOME"/zsh/hack.zsh-theme $HOME/.oh-my-zsh/themes/hack.zsh-theme
	ln -f "$DOTHOME"/zsh/pyzhon.zsh-theme $HOME/.oh-my-zsh/themes/pyzhon.zsh-theme
	ln -f "$DOTHOME"/zsh/.zshrc $HOME/.zsh/.zshrc
	ln -f $HOME/.zsh/.zshrc $HOME/.zshrc
	ln -f "$DOTHOME"/zsh/.aliases $HOME/.zsh/.aliases
	ln -f "$DOTHOME"/zsh/.zplug $HOME/.zsh/.zplug
	ln -f "$DOTHOME"/zsh/.directory $HOME/.zsh/.directory

	mkdir -p $HOME/Projects/go
	mkdir -p $HOME/Maker
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
