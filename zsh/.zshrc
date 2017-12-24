# Global config ----------------------------------------------------------- {{{
export ZSH=/home/jorge/.oh-my-zsh
export UPDATE_ZSH_DAYS=23
ZSH_THEME="hack"
HIST_STAMPS="dd.mm.yyyy"
DISABLE_CORRECTION=true						# Disable autocorrect
ZSH_TMUX_AUTOSTART=true						# Tmux variable
ZSH_TMUX_AUTOCONNECT=false				# Tmux variable
# Plugins
plugins=(git tmux last-working-dir wd)
stty -ixon												# Disable ctrl+s
export TERM="xterm-256color"			# terminator with 256 colors to vim
source $ZSH/oh-my-zsh.sh
# }}}

# User config ------------------------------------------------------------- {{{
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/bin/python:$HOME/bin"

export PATH="$PATH:$HOME/kali/metasploit-framework"
export PATH="$PATH:$HOME/kali/beef"
export PATH="$PATH:$HOME/kali/set"
export PATH="$PATH:$HOME/kali/sqlmap-dev"
export PATH="$PATH:$HOME/kali/john/run"
export PATH="$PATH:$HOME/kali/encoder"
export PATH="$PATH:$HOME/Github/darknet"

export EDITOR="/usr/bin/vim"
# GO path{{{
export GOPATH=$HOME/Github/go
export PATH="$PATH:$GOPATH/bin"
# }}}
# Virtualenvwrapper (python){{{
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
# }}}
# Rbenv (ruby){{{
export PATH="$PATH:$HOME/.rbenv/shims:$HOME/.rbenv/bin"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"
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

# Run on startup terminal
#if [[ -n "$TMUX" ]] && [[ ! -e "/root/.automatic_start_occurred" ]];then
	#fortune vN4 | cowsay -f three-eyes -e -- && echo -e "\e[33m['https://quizlet.com/106562829/vocabulario-noken-4-hiraganakanjiespanol-flash-cards/']\e[0m\n"
	#screenfetch
#fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=$(tty)
