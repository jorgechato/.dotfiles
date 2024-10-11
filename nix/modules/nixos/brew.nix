{ pkgs, lib, config, ... }:
let
  casks = import ./deps/casks.nix;
  casksWork = import ./deps/casks-work.nix;
  casksHome = import ./deps/casks-home.nix;

  brews = import ./deps/brews.nix;
  brewsWork = import ./deps/brews-work.nix;
  brewsHome = import ./deps/brews-home.nix;
in
{
  options = {
    isWork = {
      enable = lib.mkOption {
        default = false;
        type = with lib.types; bool;
        description = "Is this a work machine?";
      };
    };
  };

  config = {
    homebrew = {
      enable = true;
      # masApps = [];
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
      brews = lib.mkMerge [
        brews
        (lib.mkIf config.isWork brewsWork)
        (lib.mkIf (config.isWork == false) brewsHome)
      ];
      casks = lib.mkMerge [
        casks
        (lib.mkIf config.isWork casksWork)
        (lib.mkIf (config.isWork == false) casksHome)
      ];
    };

  };
}

