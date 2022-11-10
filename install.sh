#!/bin/bash


. base.sh


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
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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


	INSTALL_LIST="awscli fish zsh zplug neovim git tree nmap nvm jenv fortune kubectl the_silver_searcher fzf tfenv pyenv poetry bat httpie grex gh direnv z"
	INSTALL_LIST_CASK="iterm2 java vimr jetbrains-toolbox miniconda insomnia"

	echo "Installing ($INSTALL_LIST)..."

    brew tap aws/tap
    brew tap dart-lang/dart
	brew install $INSTALL_LIST
	brew install --cask $INSTALL_LIST_CASK

	gitInstall

	CHECK_LIST="fish zsh zplug nvim vimr git tree nmap aws kubectl ag fzf tfenv pyenv poetry bat http grex gh direnv z"

	for item in $CHECK_LIST; do
		checkInstall "$item"
	done

    #Install fzf.zsh file
    $(brew --prefix)/opt/fzf/install
}

init_linux() {
	sudo apt-get update
	sudo apt-get upgrade

	sh -c "$(curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh)"

	CHECK_LIST="curl wget fish zsh vim gvim git tmux"

	INSTALL_LIST="curl wget terminator fish zsh vim-python-jedi git tmux irssi"

	echo "Installing ($INSTALL_LIST)..."

	sudo apt-get -y install $INSTALL_LIST

	gitInstall

	for item in $(seq 1 $CHECK_LIST); do
		checkInstall "$item"
	done
}

main() {
	init

	git clone https://github.com/jorgechato/.dotfiles.git "$DOTHOME"

    . config.sh

	printf "${GREEN}"
	echo 'https://github.com/jorgechato/.dotfiles ....is now installed!'
	echo ''
	echo ''
	echo 'p.s. Follow me at https://jorgechato.com'
	echo ''
	printf "${NORMAL}"
}

main
