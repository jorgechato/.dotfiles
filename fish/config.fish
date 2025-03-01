. "$HOME/.config/fish/aliases.fish"

set -x EDITOR nvim
set -x SVN_EDITOR nvim
set -x VISUAL nvim
set -x PAGER bat
set -x LC_CTYPE en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -g fish_greeting
set -gx DIRENV_LOG_FORMAT ""

#Starship
starship init fish | source

#Custom Functions
set -x KPUF_CONFIG_FILE "$HOME/.config/fish/functions/kpuf.yaml"

# nnn
set -x NNN_USE_EDITOR nvim
set -x NNN_NOTE $HOME/.scratchpad
set -x BOOKMARK $HOME/Dropbox/Apps/Bookmarks/

# preload fish
function __check_z --on-variable PWD --description 'Setup z on directory change'
    status --is-command-substitution
    and return
    bash -c "source /usr/local/etc/profile.d/z.sh; _z --add `pwd -P`"
end

#Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

#User config
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x DOTHOME "$HOME/.dotfiles"
set -x PATH "$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:$HOME/bin:/usr/local/sbin:/usr/local/opt/libpq/bin"
set -x PATH "$PATH:$HOME/.config/fish/config.fish"
set -x PATH "$PATH:/usr/local/opt/findutils/libexec/gnubin"
set -x PATH "$PATH:/Users/jorge/.local/bin"
set -x PATH "$PATH:/run/current-system/sw/bin" # NixOS
test -e {$HOME}/.iterm2_shell_integration.fish
and source {$HOME}/.iterm2_shell_integration.fish

#GO
set -x -x GOPATH $HOME/Projects/go
set -x PATH "$GOPATH/bin" "$PATH"
set -x GOPRIVATE "github.com/garajonai/*,github.com/kouzoh/*"
set -x GONOPROXY "github.com/garajonai/*,github.com/kouzoh/*"
set -x GONOSUMDB "github.com/garajonai/*,github.com/kouzoh/*"

#Rust
set -x PATH "$HOME/.cargo/bin" "$PATH"

#Java
set PATH $HOME/.jenv/bin $PATH
#status --is-interactive; and jenv init - | source
#eval "$(jenv init - --no-rehash)"
#status --is-interactive; and jenv init - fish | source

#FNM
fnm env --use-on-cd | source

#direnv
direnv hook fish | source

# CTR-R
set -Ux FZF_DEFAULT_OPTS "--color=fg:-1,bg:-1,hl:#0086b3 --color=fg+:#c94e6b,bg+:-1,hl+:#d81745 --color=info:#707070,prompt:#0086b3,pointer:#d81745 --color=marker:#960b73,spinner:#707070,header:#999999"

if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
# set --export --prepend PATH "/Users/jorge/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
