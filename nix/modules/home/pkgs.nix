{ self, pkgs, ... }:

{
  home.packages = [
    pkgs.raycast
    pkgs.fish
    pkgs.git
    pkgs.starship
    pkgs.direnv
    pkgs.fzf
    pkgs.vscode
    pkgs.z-lua
    pkgs.grc
  ];
}
