# JORGE CHATO .dotfiles

> [!WARNING]
> Set up the repository with the proper hooks. Run `pre-commit install` in the root directory of the repository.

## Devices

- `ni` - Apple (M)
- `work` - Apple (M) - Work device

## Basic Installation

1. Install Nix
    ```shell
    $ sh <(curl -L https://nixos.org/nix/install)
    # or
    $ curl -L https://nixos.org/nix/install | sh
    ```
2. Download configuration
    ```shell
    $ nix-shell -p git --run 'git clone https://github.com/jorgechato/.dotfiles.git ~/.dotfiles'
    ```
3. Install configuration
    ```shell
    $ nix run nix-darwin --experimental-features 'nix-command flakes' -- switch --impure --flake ~/.dotfiles/nix#ni # change ni with the device name
    ```

## Extra configuration

1. Enable `1Password` **ssh**
2. Enable Dock magnify and run the configuration again with `darwin-rebuild switch`
3. Set up [nushell](#nushell)
4. Import `raycast` configuration
    - Disable spotlight hotkeys
5. Import `streamdeck` configuration
6. Disable mission control hot corners
7. Add Keyboard input sources (*System settings > Keyboard > Text input > Input Sources*)
8. Install `node` with `fnm install 22.11`
9. Setup rust version `rustup default stable`

### Nushell

If `nu` is not in your path, most likely it's in `/run/current-system/sw/bin/nu` folder.

```sh
$ export XDG_CONFIG_HOME="/Users/jorge/.config" #or if you are in fish: $ set XDG_CONFIG_HOME "/Users/jorge/.config"
$ sudo echo $(which nu) >> /etc/shells
$ chsh -s $(which nu)
# If the new term doesn't use the correct XDG_CONFIG_HOME, run:
$ echo "source ~/.config/nushell/config.nu" | sudo $nu.current-exe --stdin -c "save -f $nu.config-path"
$ echo "source ~/.config/nushell/env.nu" | sudo $nu.current-exe --stdin -c "save -f $nu.env-path"
```

## Add new package

1. Add package to `environment.systemPackages` in `nix/modules/nixos/pkgs.nix` or `nix/modules/nixos/deps/*`
2. Install package
    ```shell
    $ darwin-rebuild switch --flake ~/.dotfiles/nix#ni # change ni with the device name
    # if you have nushell already set up, run:
    $ nix reload <host>
    ```

## Common errors

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
