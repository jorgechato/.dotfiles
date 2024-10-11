{ pkgs, lib, ... }:
{
  imports = [
    ./settings.nix
    ./pkgs.nix
    ./system.nix
    ./ui.nix
  ];
}
