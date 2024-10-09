# JORGE CHATO .dotfiles

## Basic Installation

1. Install Nix
    ```shell
    $ curl -L https://nixos.org/nix/install | sh
    ```
2. Download configuration
    ```shell
    $ nix-shell -p git --run 'git clone git@github.com:jorgechato/.dotfiles.git ~/.dotfiles'
    ```
3. Install configuration
    ```shell
    $ nix-shell run nix-darwin --experimental-features 'nix-command flakes' -- switch --flake ~/.dotfiles/nix/darwin#ichi # change ichi with the device name
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
