#!/bin/bash


. base.sh

sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)

printf "${YELLOW}"
echo "System configuration..."
printf "Current file directory: ${NORMAL}"
echo "$DOTHOME"

ln -f "$DOTHOME"/git/.gitconfig $HOME/.gitconfig

if [ $OS == "linux" ]; then
    cp -f -R "$DOTHOME"/fortune/* /usr/share/games/fortunes/
elif [ $OS == "mac" ]; then
    fortuneV=$(fortune -V 2>&1 | sed -n 2p | cut -d' ' -f 3)
    #cp -f -R "$DOTHOME"/fortune/* /usr/local/Cellar/fortune/$fortuneV/share/games/fortunes/
fi

git config --global --unset-all core.editor
git config --unset-all core.editor
git config --global core.editor "nvim -f"

mkdir -p $HOME/.vim/tmp/backup
mkdir -p $HOME/.vim/tmp/swap
mkdir -p $HOME/.vim/tmp/undo
mkdir -p $HOME/.vim/core
ln -f "$DOTHOME"/vim/vimrc $HOME/.vim/vimrc
ln -f $HOME/.vim/vimrc $HOME/.vimrc
ln -f "$DOTHOME"/vim/ideavimrc $HOME/.ideavimrc
ln -f "$DOTHOME"/vim/core/* $HOME/.vim/core

mkdir -p $HOME/.config/nvim/lua/core
mkdir -p $HOME/.config/nvim/lua/plugins
ln -f "$DOTHOME"/nvim/init.lua $HOME/.config/nvim/init.lua
ln -f "$DOTHOME"/nvim/plugins/*.lua $HOME/.config/nvim/lua/plugins
ln -f "$DOTHOME"/nvim/core/*.lua $HOME/.config/nvim/lua/core

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

rm -rf $HOME/.config/fish/*
mkdir -p $HOME/.config/fish/functions $HOME/.config/fish/conf.d $HOME/.config/fish/completions
ln -sf "$DOTHOME"/fish/config.fish $HOME/.config/fish/
ln -sf "$DOTHOME"/fish/aliases.fish $HOME/.config/fish/
ln -sf "$DOTHOME"/fish/aliases-work.fish $HOME/.config/fish/
ln -sf "$DOTHOME"/fish/fish_plugins $HOME/.config/fish/
ln -sf "$DOTHOME"/fish/functions/* $HOME/.config/fish/functions/
ln -sf "$DOTHOME"/fish/conf.d/* $HOME/.config/fish/conf.d/


ln -sf "$DOTHOME"/starship/starship.toml $HOME/.config/starship.toml

ln -f "$DOTHOME"/.editorconfig $HOME/.editorconfig

mkdir -p $HOME/Projects
mkdir -p $HOME/Maker

printf "${GREEN}"
echo "Configuration applied"
printf "${NORMAL}"
