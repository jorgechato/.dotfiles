{ self, pkgs, ... }:

{
  home.packages = [
    pkgs.raycast
    pkgs.git
    pkgs.starship
    pkgs.direnv
    pkgs.fzf
    pkgs.vscode
    pkgs.z-lua
    pkgs.grc
  ];
}
