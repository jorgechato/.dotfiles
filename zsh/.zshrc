# Path to your oh-my-zsh installation.
export ZSH=/home/orggue/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="awesomepanda"
#ZSH_THEME="geoffgarside"
#ZSH_THEME="fwalch"
#ZSH_THEME="sorin"
ZSH_THEME="minimal"
#ZSH_THEME="kolo"
#ZSH_THEME="mgutz"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/share/python:/usr/local/share/npm/bin"
#hombrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
# export MANPATH="/usr/local/man:$MANPATH:"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# disable ctrl+s
stty -ixon

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Scripts
alias number="python ~/APP/scipts/number.py"
alias name="python ~/APP/scipts/name.py"

# Example aliases
uni(){cd ~/Dropbox/'II_2015_2016'/"$*"}
vuni(){vim ~/Dropbox/'II_2015_2016'/"$*"}
#alias v="vim"
v(){vim "$*"}
book(){
  if [ "$*" ]; then
    git clone https://github.com/orggue/nerdbook-studio.git "$*" ; cd "$*" ; npm install ; node init.js
  else
    git clone https://github.com/orggue/nerdbook-studio.git ; cd nerdbook-studio ; npm install ; node init.js
  fi
}
epubcheck(){
  if [ "$*" ]; then
    java -jar ~/APP/epubcheck-4.0.1/epubcheck.jar "$*"
  else
    echo "ERROR: You need to send an epub"
  fi
}
imp(){
  if [ "$*" ]; then
    cd ~/Github/wordpress/site/web/app/themes/imposible ; "$*"
  else
    cd ~/Github/wordpress/site/web/app/themes/imposible
  fi
}
gitoliteconf(){
  if [ "$*" ]; then
    ssh -o PubkeyAuthentication=no gitolite@"$*"
  else
    ssh -o PubkeyAuthentication=no gitolite@nas.jorgechato.com
  fi
}
#conection to
alias unizar="ssh i651348@esquinazo.unizar.es"
pi(){
  if [ "$*" ]; then
    ssh pi@"$*"
  else
    ssh pi@nas.jorgechato.com
  fi
}
alias gip="ip route"
alias unisubl="subl ~/Dropbox/'II_2015_2016'"
alias arduino="APP/arduino-1.6.5-r5/arduino"
alias py="python"
alias speed="speedtest-cli"
alias o="gnome-open"
alias redis="~/APP/Redis/src/redis-server"
alias zshconfig="vim ~/.zshrc"
alias vimcoloradmin="cd /usr/share/vim/vim74/colors"
alias vimcolor="cd ~/.vim/color"
alias vimconfig="vim ~/.vimrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias list="sudo vim /etc/apt/sources.list"
alias stoplight="killall -USR1 redshift"
alias startlight="redshift &"
alias herokulog="heroku logs --tail"
alias terminatorconfig="vim ~/.config/terminator/config"
alias apache="sudo vim /etc/apache2/sites-available/wordpress.conf ; sudo /etc/init.d/apache2 restart"
alias phpini="sudo vim /etc/php5/cli/php.ini ; sudo /etc/init.d/apache2 restart"
alias hosts="sudo vim /etc/hosts"
alias wifi="kde-nm-connection-editor"

#alias mdb="mongod --dbpath mongodb/data/db"

# terminator with 256 colors to vim
export TERM="xterm-256color"

# tmux
if [ "$TMUX" = "" ]; then tmux; fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
