{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs-unstable.discord
    pkgs.fish
    pkgs.git
    pkgs.nvim
    pkgs.starship
    pkgs.direnv
    pkgs.fzf
    pkgs.z-lua
    pkgs.vscode
  ];
}
