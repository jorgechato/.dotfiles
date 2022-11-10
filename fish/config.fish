. "$HOME/.config/fish/aliases.fish"

set -x EDITOR nvim
set -x SVN_EDITOR nvim
set -x VISUAL nvim
set -x PAGER bat
set -x LC_CTYPE en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8

#GO
set -x -x GOPATH ~/Documents/resources/go

# nnn
set -x NNN_USE_EDITOR 1
set -x NNN_NOTE $HOME/.scratchpad
set -x BOOKMARK $HOME/Dropbox/Apps/Bookmarks/

# preload fish
#function __check_z --on-variable PWD --description 'Setup z on directory change'
    #status --is-command-substitution
    #and return
    #bash -c "source /usr/local/etc/profile.d/z.sh; _z --add `pwd -P`"
#end

set -x PATH $HOME/.cargo/bin $PATH
test -e {$HOME}/.iterm2_shell_integration.fish
and source {$HOME}/.iterm2_shell_integration.fish

#direnv
direnv hook fish | source

# CTR-R
set -Ux FZF_DEFAULT_OPTS "--color=fg:-1,bg:-1,hl:#0086b3 --color=fg+:#c94e6b,bg+:-1,hl+:#d81745 --color=info:#707070,prompt:#0086b3,pointer:#d81745 --color=marker:#960b73,spinner:#707070,header:#999999"
