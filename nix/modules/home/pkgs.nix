{ self, pkgs, ... }:

{
  home.packages = [
    pkgs.fish
    pkgs.git
    pkgs.starship
    pkgs.direnv
    pkgs.fzf
    pkgs.z-lua
    pkgs.vscode
  ];
}
