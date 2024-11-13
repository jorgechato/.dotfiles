{ self, pkgs, lib, ... }:
{
  options = {
    dep.isWork = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Is this a work machine?";
    };
    ui.isWork = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Is this a work machine?";
    };
  };

  imports = [
    ./pkgs.nix
    ./system.nix
    ./mac.nix
    ./security.nix
    ./brew.nix
  ];
}
