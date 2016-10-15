# Path to your oh-my-zsh installation.
export ZSH=/home/fragmentado/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="pyzhon"
ZSH_THEME="hack"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
export PATH="$PATH:$HOME/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/share/python:/usr/sbin"
export PATH="$PATH:/home/fragmentado/.rvm/gems/ruby-2.3.1@global"
#export PATH="$PATH:/home/fragmentado/.rvm/gems/ruby-2.3.0@beef:/home/fragmentado/.rvm/gems/ruby-2.3.1@metasploit-framework"
export PATH="$PATH:/opt/metasploit-framework:/opt/beef"
export EDITOR="/usr/bin/vim"
############# virtualenvwrapper start
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
############# virtualenvwrapper end

source $ZSH/oh-my-zsh.sh

# disable ctrl+s
stty -ixon

# Aliases
uni(){cd ~/Dropbox/'II_2016_2017'/"$*"}
vuni(){vim ~/Dropbox/'II_2016_2017'/"$*"}
# alias v="vim"
v(){vim "$*"}
book(){
  if [ "$*" ]; then
    git clone https://github.com/orggue/nerdbook-studio.git "$*" ; cd "$*" ; npm install ; node init.js
  else
    git clone https://github.com/orggue/nerdbook-studio.git ; cd nerdbook-studio ; npm install ; node init.js
  fi
}
# conection to
alias unizar="ssh i651348@esquinazo.unizar.es"
alias hendrix="TERM=linux ssh -X a651348@hendrix-ssh.cps.unizar.es -t zsh"
pi(){
  if [ "$*" ]; then
    ssh pi@"$*"
  else
    ssh pi@nas.jorgechato.com
  fi
}
phpserver(){
  if [ "$*" ]; then
    php -S localhost:"$*"
  else
    php -S localhost:9000
  fi
}
php5server(){
  if [ "$*" ]; then
    php5 -S localhost:"$*"
  else
    php5 -S localhost:9000
  fi
}
# record
rec(){
  if [ "$*" ]; then
    ~/APP/asciinema/asciinema rec "$*"
  else
    ~/APP/asciinema/asciinema
  fi
}
play(){
  if [ "$*" ]; then
    ~/APP/asciinema/asciinema play "$*"
  else
    ~/APP/asciinema/asciinema
  fi
}
# psql
pypsql(){
  if [ "$*" ]; then
    psql -U fragmentado -d "$*" -h localhost
  else
    echo 'ERROR:: You forgot add the db name in psql -U fragmentado -d <<database name>> -h localhost'
  fi
}
# irc
alias irssi='TERM=screen-256color irssi'
alias bitchx='TERM=screen-256color bitchx'
# alias
alias eject="sudo eject"
alias gip="ip route"
alias py="python"
alias rm="rm -i"
alias o="xdg-open"
alias zshconfig="vim ~/.zshrc"
alias vimcoloradmin="cd /usr/share/vim/vim74/colors"
alias vimcolor="cd ~/.vim/color"
alias vimconfig="vim ~/.vimrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias list="v /etc/apt/sources.list"
alias links="links2"
alias herokulog="heroku logs --tail"
alias terminatorconfig="vim ~/.config/terminator/config"
#alias apache="vim /etc/apache2/sites-available/ ; sudo /etc/init.d/apache2 restart"
alias hosts="vim /etc/hosts"
alias ly="teamocil"
alias cownobel="fortune es/ciencia.fortunes | cowsay | lolcat"
alias horario="xdg-open ~/Dropbox/II_2016_2017/res/horario/public/horario-2016-17.pdf"
#alias two="xrandr --listproviders && xrandr --setprovideroutputsource 1 0 && xrandr --setprovideroutputsource 2 0"
# Scripts
alias number="python ~/APP/Scipts/number.py"
alias name="python ~/APP/Scipts/name.py"
alias talk="~/APP/bash/talk.sh"
alias bitcoin="~/APP/bash/bitcoin.sh"

# terminator with 256 colors to vim
export TERM="xterm-256color"
umask 077

# tmux
if [ "$TMUX" = "" ]; then tmux has-session -t 'Doctor' || tmux new-session -s 'Doctor'; fi
if [[ -n "$TMUX" ]] && [[ ! -e "/root/.automatic_start_occurred" ]];then
  fortune es/ciencia.fortunes | cowsay | lolcat
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PATH="/home/fragmentado/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/fragmentado/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/fragmentado/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/fragmentado/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/fragmentado/perl5"; export PERL_MM_OPT;
