# Global config -----------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=23
ZSH_THEME="hack"
HIST_STAMPS="dd.mm.yyyy"
DISABLE_CORRECTION=true    # Disable autocorrect
ZSH_TMUX_AUTOSTART=true    # Tmux variable
ZSH_TMUX_AUTOCONNECT=false # Tmux variable
export HISTIGNORE="[ ]*"
export FZF_BASE=/usr/local/opt/fzf/install
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
stty -ixon # Disable ctrl+s
export TERM="screen-256color" # terminator with 256 colors to vim

source $ZSH/oh-my-zsh.sh

# Zplug
source $HOME/.zplug/init.zsh

if [ -e "$HOME/.zsh/.zplug" ]; then
    source "$HOME/.zsh/.zplug"
fi

# User config -------------------------------------------------------------
export DOTHOME="$HOME/.dotfiles"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:$HOME/bin:/usr/local/sbin"
export PATH="$PATH:$HOME/.jenv/bin"

export EDITOR="/usr/local/bin/nvim"

# Aliases
if [ -e "$HOME/.zsh/.aliases" ]; then
    source "$HOME/.zsh/.aliases"
fi

# GO path
export GOPATH=$HOME/Projects/go
export PATH="$PATH:$GOPATH/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Python
# # Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

eval "$(pyenv init -)"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
# jenv (Java)
eval "$(jenv init -)"

# NVM (node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export GPG_TTY=$(tty)

# Run on startup terminal
if [[ ! -e "/root/.automatic_start_occurred" ]]; then
    fortune vN4
fi
# -------------------------------------------------------------------------

# added by travis gem
# [ -f /Users/jorge/.travis/travis.sh ] && source /Users/jorge/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
