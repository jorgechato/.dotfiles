# JORGE CHATO .dotfiles

### Basic Installation

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
