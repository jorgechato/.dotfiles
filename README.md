# JORGE CHATO .dotfiles

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
    $ nix run nix-darwin --experimental-features 'nix-command flakes' -- switch --flake ~/.dotfiles/nix#ichi # change ichi with the device name
    ```

## Add new package

1. Add package to `environment.systemPackages` in `nix/flake.nix`
2. Install package
    ```shell
    $ darwin-rebuild switch --flake ~/.dotfiles/nix#ichi # change ichi with the device name
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
