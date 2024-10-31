{ pkgs, lib, ... }:
{
  imports = [
    ./pkgs.nix
    ./system.nix
    ./mac.nix
    ./security.nix
  ];
}
