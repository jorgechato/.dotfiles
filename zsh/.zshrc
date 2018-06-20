# Global config ----------------------------------------------------------- {{{
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=23
ZSH_THEME="hack"
HIST_STAMPS="dd.mm.yyyy"
DISABLE_CORRECTION=true						# Disable autocorrect
ZSH_TMUX_AUTOSTART=true						# Tmux variable
ZSH_TMUX_AUTOCONNECT=false				# Tmux variable
# Plugins
plugins=(git last-working-dir wd osx xcode)
stty -ixon												# Disable ctrl+s
export TERM="xterm-256color"			# terminator with 256 colors to vim
source $ZSH/oh-my-zsh.sh
# }}}

# User config ------------------------------------------------------------- {{{
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:$HOME/bin"

export PATH="$PATH:$HOME/miniconda3/bin"
export PATH="$PATH:$HOME/kali/metasploit-framework"
export PATH="$PATH:$HOME/kali/beef"
export PATH="$PATH:$HOME/kali/set"
export PATH="$PATH:$HOME/kali/sqlmap-dev"
export PATH="$PATH:$HOME/kali/john/run"
export PATH="$PATH:$HOME/kali/encoder"
export PATH="$PATH:$HOME/Github/darknet"

export EDITOR="/usr/local/bin/mvim"
# GO path{{{
export GOPATH=$HOME/Projects/go
export PATH="$PATH:$GOPATH/bin"
# }}}
# Python {{{
export PYTHONPATH="$PYTHONPATH:$HOME/miniconda3/lib/python3.6/site-packages/"
# }}}
# NVM (node){{{
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# }}}
# }}}

# Aliases
if [ -e "$HOME/.zsh/.aliases" ]; then
	source "$HOME/.zsh/.aliases"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)
