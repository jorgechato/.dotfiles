{ pkgs, lib, ... }:
{
  imports = [
    ./settings.nix
    ./pkgs.nix
    ./system.nix
    ./ui.nix
  ];

  defaults.withChrome = lib.mkDefault false;
  brew.isWork = lib.mkDefault false;
}
