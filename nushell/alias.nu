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

#Nix
alias dr = darwin-rebuild switch --impure --flake

#Sudo
# save a file, with sudo
export def "sudo save" [
  --raw(-r), # save file as raw binary
  --append(-a), # append input to the end of the file
  --force(-f), # overwrite the destination file if it exists
  --progress(-p), # enable progress bar
  filename: path # The filename to use
]: string -> nothing {
  let flags = [
    (if $raw { "--raw" })
    (if $append { "--append" })
    (if $force { "--force" })
    (if $progress { "--progress" })
  ] | compact
  $in | sudo $nu.current-exe --stdin -c $"save ($flags | str join ' ') ($filename)"
}
