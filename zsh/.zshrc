# Global config -----------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=23
ZSH_THEME="hack"
HIST_STAMPS="dd.mm.yyyy"
DISABLE_CORRECTION=true						# Disable autocorrect
ZSH_TMUX_AUTOSTART=true						# Tmux variable
ZSH_TMUX_AUTOCONNECT=false				# Tmux variable
export HISTIGNORE="[ ]*"

# Plugins
plugins=(git last-working-dir wd osx iterm2)
stty -ixon												# Disable ctrl+s
export TERM="xterm-256color"			# terminator with 256 colors to vim
source $ZSH/oh-my-zsh.sh

# Zplug
source $HOME/.zplug/init.zsh

if [ -e "$HOME/.zsh/.zplug" ]; then
	source "$HOME/.zsh/.zplug"
fi
# -------------------------------------------------------------------------

# User config -------------------------------------------------------------
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:$HOME/bin:/usr/local/sbin"
export PATH="$PATH:$HOME/miniconda3/bin"
export PATH="$PATH:$HOME/.jenv/bin"
export PATH="$PATH:$HOME/kali/metasploit-framework"
export PATH="$PATH:$HOME/kali/beef"
export PATH="$PATH:$HOME/kali/set"
export PATH="$PATH:$HOME/kali/sqlmap-dev"
export PATH="$PATH:$HOME/kali/john/run"
export PATH="$PATH:$HOME/kali/encoder"
export PATH="$PATH:$HOME/Github/darknet"

export EDITOR="/usr/local/bin/mvim"

# Aliases
if [ -e "$HOME/.zsh/.aliases" ]; then
	source "$HOME/.zsh/.aliases"
fi

# GO path
export GOPATH=$HOME/Projects/go
export PATH="$PATH:$GOPATH/bin"

# Python
export PYTHONPATH="$PYTHONPATH:/miniconda3/lib/python3.7/site-packages/"
. /miniconda3/etc/profile.d/conda.sh

# jenv (Java)
eval "$(jenv init -)"

# NVM (node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# asdf virtual machine (ruby, node, elixir)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.gcloud-sdk/path.zsh.inc" ]; then
	source "$HOME/.gcloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.gcloud-sdk/completion.zsh.inc" ]; then
	source "$HOME/.gcloud-sdk/completion.zsh.inc"
fi

# Run on startup terminal
if [[ ! -e "/root/.automatic_start_occurred" ]]; then
	fortune vN4
fi
# -------------------------------------------------------------------------

# added by travis gem
[ -f /Users/jorge/.travis/travis.sh ] && source /Users/jorge/.travis/travis.sh
