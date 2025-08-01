alias l = ls -a
alias ll = ls -la
alias cd.. = cd ..
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..
alias cx = chmod +x
alias c-x = chmod -x

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

# Sudo
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

# me
# present my resume
export def "me" [
    --pdf # export to pdf
] {
    if $pdf {
        ^presenterm --export-pdf -t light $"($env.HOME)/Projects/github/jorgechato/INTRODUCTION.md"
    } else {
        ^presenterm $"($env.HOME)/Projects/github/jorgechato/INTRODUCTION.md"
    }
}

# image
export def "image" [
    image: path
] {
    kitty +kitten icat $image
}

# nix reload
# reload nix configuration for a specific host
export def "nix reload" [
    host: string # host name, one of: `ichi, ni, work`
    --update (-u) # update flake
    --clean (-c) # clean nix store
] {
    let nix_path = $env.HOME + $"/.dotfiles/nix"
    let nix_host = $"($nix_path)#($host)"

    if $update {
        ^nix-channel --update
        ^nix-env -u
        ^nix flake update --flake $nix_path
    }

    if $clean {
        ^nix-collect-garbage -d
    }

    sudo darwin-rebuild switch --flake $nix_host
}
