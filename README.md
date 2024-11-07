# JORGE CHATO .dotfiles

## Devices

- `ichi` - MacBook Pro (Intel)
- `ni` - MacBook Pro (M4)
- `work` - MacBook Pro (Mx) - Work device

## Basic Installation

1. Install Nix
    ```shell
    $ curl -L https://nixos.org/nix/install | sh
    # or
    $ sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
    ```
2. Download configuration
    ```shell
    $ nix-shell -p git --run 'git clone git@github.com:jorgechato/.dotfiles.git ~/.dotfiles'
    # and install flake with nix-darwin
    $ cd ~/.dotfiles/nix/ && nix flake update --extra-experimental-features "nix-command flakes" && cd ~
    ```
3. Install configuration
    ```shell
    $ nix run nix-darwin --experimental-features 'nix-command flakes' -- switch --impure --flake ~/.dotfiles/nix#ni # change ni with the device name
    ```

## Add new package

1. Add package to `environment.systemPackages` in `nix/flake.nix`
2. Install package
    ```shell
    $ darwin-rebuild switch --impure --flake ~/.dotfiles/nix#ni # change ni with the device name
    ```
## Extra configuration

### Nushell
```sh
$ export XDG_CONFIG_HOME="/Users/jorge/.config" #or if you are in fish: $ set XDG_CONFIG_HOME "/Users/jorge/.config"
$ sudo echo $(which nu) >> /etc/shells
$ chsh -s $(which nu)
# If the new term doesn't use the correct XDG_CONFIG_HOME, run:
$ echo "source ~/.config/nushell/config.nu" | sudo $nu.current-exe --stdin -c "save -f $nu.config-path"
$ echo "source ~/.config/nushell/env.nu" | sudo $nu.current-exe --stdin -c "save -f $nu.env-path"
```

## Common errors

### error: path '/nix/store/pq2iwm2pxn19nikkxfk0b87p817lcn2l-source/nix/flake.nix' does not exist

This error is due to the use of a git folder for nix flakes. To fix it, you need to commit your changes before running the command.

### error: I need to back up /etc/bashrc to /etc/bashrc.backup-before-nix, but the latter already exists.

```bash
$ sudo rm -rf /etc/bashrc /etc/bashrc.backup-before-nix /etc/bashrc.before-nix-darwin /etc/bash.bashrc.backup-before-nix /etc/zshrc /etc/zshrc.backup-before-nix && \
  sudo touch /etc/bashrc && \
  sudo touch /etc/zshrc && \
  sudo unlink /etc/bashrc && \
  sudo unlink /etc/zshrc
```

### error: unable to download xxx : Problem with the SSL CA cert (path? access rights?) (77)

[solution](https://github.com/NixOS/nix/issues/3261)

### Uninstall [steps](https://github.com/NixOS/nix/blob/master/doc/manual/source/installation/uninstall.md)
