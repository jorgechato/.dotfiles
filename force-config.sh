#!/bin/bash


. base.sh

printf "${YELLOW}"
echo "System configuration..."
printf "Current file directory: ${NORMAL}"
echo "$DOTHOME"

#GIT
ln -f "$DOTHOME"/git/.gitconfig $HOME/.gitconfig

#NVIM
mkdir -p $HOME/.vim/tmp/backup
mkdir -p $HOME/.vim/tmp/swap
mkdir -p $HOME/.vim/tmp/undo
mkdir -p $HOME/.vim/core
ln -f "$DOTHOME"/vim/vimrc $HOME/.vim/vimrc
ln -f $HOME/.vim/vimrc $HOME/.vimrc
ln -f "$DOTHOME"/vim/ideavimrc $HOME/.ideavimrc
ln -f "$DOTHOME"/vim/core/* $HOME/.vim/core

mkdir -p $HOME/.config/nvim
ln -f "$DOTHOME"/nvim/init.vim $HOME/.config/nvim/init.vim

#FISH
rm -rf $HOME/.config/fish/*
rm -rf $HOME/.config/omf/*
mkdir -p $HOME/.config/fish/functions $HOME/.config/fish/conf.d $HOME/.config/fish/completions
mkdir -p $HOME/.config/omf
ln -sf "$DOTHOME"/fish/config.fish $HOME/.config/fish/
ln -sf "$DOTHOME"/fish/aliases.fish $HOME/.config/fish/
ln -sf "$DOTHOME"/fish/fish_variables $HOME/.config/fish/
#ln -sf "$DOTHOME"/fish/functions/* $HOME/.config/fish/functions/
ln -sf "$DOTHOME"/fish/conf.d/* $HOME/.config/fish/conf.d/
#ln -sf "$DOTHOME"/fish/completions/* $HOME/.config/fish/completions/
ln -sf "$DOTHOME"/omf/* $HOME/.config/omf/

ln -f "$DOTHOME"/.editorconfig $HOME/.editorconfig

printf "${GREEN}"
echo "Configuration applied"
printf "${NORMAL}"