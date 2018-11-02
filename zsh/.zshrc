# Global config -----------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=23
ZSH_THEME="hack"
HIST_STAMPS="dd.mm.yyyy"
DISABLE_CORRECTION=true						# Disable autocorrect
ZSH_TMUX_AUTOSTART=true						# Tmux variable
ZSH_TMUX_AUTOCONNECT=false				# Tmux variable
#
# Plugins
plugins=(git last-working-dir wd osx xcode)
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

# Aliases
if [ -e "$HOME/.zsh/.aliases" ]; then
	source "$HOME/.zsh/.aliases"
fi

# Kubernetes
KUBEFOLDER=/keybase/team
if [ -d $KUBEFOLDER ]; then
	cat $(find $KUBEFOLDER/* -not -name "*.*" -not -name "*adida*" -type f | grep -E "k8s|kubeconfig") > $HOME/.kube/config
fi

export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config

# GO path
export GOPATH=$HOME/Projects/go
export PATH="$PATH:$GOPATH/bin"

# Python
export PYTHONPATH="$PYTHONPATH:$HOME/miniconda3/lib/python3.6/site-packages/"
. $HOME/miniconda3/etc/profile.d/conda.sh

# NVM (node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
