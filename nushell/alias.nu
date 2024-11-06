alias l = ls -a
alias ll = ls -la
alias cd.. = cd ..
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..
alias cx = chmod +x
alias c-x = chmod -x
alias o = open

#Code
alias vim = nvim
alias g = git
alias dc = docker-compose
alias d = docker
alias k = kubectl
alias tf = terraform
alias c = cargo
alias python = python3
alias py = python3
def v [path?] {
  if $path == null {
      nvim .
  } else {
    nvim $path
  }
}

alias sourcelist = nvim /etc/apt/sources.list
alias hosts = nvim /etc/hosts

#Screen
alias yr = yabai --restart-service
alias sr = skhd --restart-service

#Nix
alias dr = darwin-rebuild switch --impure --flake
